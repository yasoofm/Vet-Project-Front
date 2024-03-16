import UIKit
import Alamofire
import SnapKit
import Kingfisher

class HomeViewController: UITableViewController {

    var name: String?
    var id: Int64?
    var role: String?
    var token: String?
    
    var vets: [VetDetails]?
       
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchVets(token: token ?? "")
        tableView.register(Home2TableViewCell.self, forCellReuseIdentifier: "Home2Cell")
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadVets), name: NSNotification.Name(rawValue: "vets"), object: nil)
    }
    
    override func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vets?.count ?? 0
    }

    override func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Home2Cell", for: indexPath) as! Home2TableViewCell
        let vet = vets?[indexPath.row]
        cell.accountImageView.kf.setImage(with: URL(string: vet?.image ?? ""))
        cell.nameLabel.text = "\(vet?.name ?? "") "
        cell.specielityLabel.text = "Speciality: \(vet?.speciality ?? "")"
        switch vet?.status ?? ""{
        case "Online":
            cell.statusLabel.text = "🟢"
        case "Offline":
            cell.statusLabel.text = "⛔️"
        case "Occupied":
            cell.statusLabel.text = "🟡"
        default: break
        }
        //cell.accountImageView.image = UIImage(named: "\(vet?.image)")
        cell.favoriteButton.tag = indexPath.row
        cell.favoriteButton.addTarget(self, action: #selector(favoriteButtonTapped(_:)), for: .touchUpInside)

        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = VetDetailsViewController()
        let selectedVets = vets?[indexPath.row]
        detailVC.role = self.role
        detailVC.token = self.token
        detailVC.vet = selectedVets
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    @objc func favoriteButtonTapped(_ sender: UIButton){
        let selectedIndex = sender.tag
        let selectedVetToBeSend = vets?[selectedIndex]

        // TODO when i click on the favorite button it should save it to the favorite screen
        let vetId = VetId(vetId: selectedVetToBeSend?.id ?? 0)
        if selectedVetToBeSend?.favorite == false {
            var endPoint = "user/add-favorite"
            if self.role == "vet"{
                endPoint = "vet/add-favorite"
            }
            NetworkManager.shared.addFavorite(token: self.token ?? "", vetId: vetId, endPoint: endPoint) { result in
                DispatchQueue.main.async {
                    switch result{
                    case .success:
                        print("added to favorite")
                        self.fetchVets(token: self.token ?? "")
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "favorites"), object: nil)
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        } else {
            var endPoint = "user/remove-favorite"
            if self.role == "vet"{
                endPoint = "vet/remove-favorite"
            }
            NetworkManager.shared.deleteFavorite(token: self.token ?? "", vetId: vetId, endPoint: endPoint) { result in
                switch result{
                case .success:
                    print("removed from favorite")
                    self.fetchVets(token: self.token ?? "")
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "favorites"), object: nil)
                case .failure(let error):
                    print(error)
                }
            }
        }
        
    }
    @objc func reloadVets(){
        fetchVets(token: self.token ?? "")
    }
    
    func fetchVets(token: String){
        if self.role == "user"{
            NetworkManager.shared.getAllVetsForUsers(token: token) { result in
                DispatchQueue.main.async {
                    switch result{
                    case .success(let vets):
                        self.vets = vets
                        self.tableView.reloadData()
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        } else {
            NetworkManager.shared.getAllVetsForVet(token: token) { result in
                DispatchQueue.main.async {
                    switch result{
                    case .success(let vets):
                        self.vets = vets
                        self.tableView.reloadData()
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        }
    }
}

