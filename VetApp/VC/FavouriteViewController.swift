import UIKit
import Alamofire
import SnapKit
import Kingfisher

class FavouriteViewController: UITableViewController {
    
    var token: String?
    var role: String?
    var favoriteVets: [VetDetails] = [VetDetails(name: "", username: "", email: "", phoneNumber: 1, speciality: "", experience: 1, equipment: "", image: "", password: "", status: "", favorite: true)]
    var selectedVet: VetDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchFavorites(token: token ?? "no token")
        view.backgroundColor = .white
        print(selectedVet ?? "not transfered")
        tableView.register(FavouriteTableViewCell.self, forCellReuseIdentifier: "Fav2Cell")
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadFavorites), name: NSNotification.Name(rawValue: "favorites"), object: nil)
    }
//TODO
        
        override func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return favoriteVets.count
        }

        override func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Fav2Cell", for: indexPath) as! FavouriteTableViewCell
            let favoriteVet = favoriteVets[indexPath.row]
            cell.accountImageView.kf.setImage(with: URL(string: favoriteVet.image))
            cell.nameLabel.text = "\(favoriteVet.name) "
            cell.specielityLabel.text = "Specialty: \(favoriteVet.speciality)"
            switch favoriteVet.status{
            case "Online":
                cell.statusLabel.text = "🟢"
            case "Offline":
                cell.statusLabel.text = "⛔️"
            case "Occupied":
                cell.statusLabel.text = "🟡"
            default: break
            }
            //cell.accountImageView.image = UIImage(named: "vet")
            cell.favoriteButton.tag = indexPath.row
            cell.favoriteButton.addTarget(self, action: #selector(favoriteButtonTapped(_:)), for: .touchUpInside)

            return cell
        }
        override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 120
        }

        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let detailVC = VetDetailsViewController()
            let selectedVets = favoriteVets[indexPath.row]
            detailVC.role = self.role
            detailVC.token = self.token
            detailVC.vet = selectedVets
            navigationController?.pushViewController(detailVC, animated: true)
        }
        
        @objc func favoriteButtonTapped(_ sender: UIButton){
            let selectedIndex = sender.tag
            let selectedVetToBeSend = favoriteVets[selectedIndex]
            
            let vetId = VetId(vetId: selectedVetToBeSend.id ?? 0)
            var endPoint = "user/remove-favorite"
            if self.role == "vet"{
                endPoint = "vet/remove-favorite"
            }
            NetworkManager.shared.deleteFavorite(token: self.token ?? "", vetId: vetId, endPoint: endPoint) { result in
                DispatchQueue.main.async {
                    switch result{
                    case .success:
                        self.fetchFavorites(token: self.token ?? "")
                        self.tableView.reloadData()
                    case .failure(let error):
                        print(error)
                    }
                }
            }

        }
    func fetchFavorites(token: String){
        var endPoint = "user/get-favorite"
        if self.role == "vet"{
            endPoint = "vet/get-favorite"
        }
        NetworkManager.shared.getFavorites(token: token, endPoint: endPoint) { result in
            DispatchQueue.main.async {
                switch result{
                case .success(let favorites):
                    print(self.favoriteVets)
                    self.favoriteVets = favorites
                    self.tableView.reloadData()
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    @objc func reloadFavorites(){
        self.fetchFavorites(token: self.token ?? "")
    }
}



