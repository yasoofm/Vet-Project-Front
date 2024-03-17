import UIKit
import Alamofire
import SnapKit
import Kingfisher

class FavouriteViewController: UITableViewController {
    
    var token: String?
    var favoriteVets: [VetDetails] = [VetDetails(name: "", username: "", email: "", phoneNumber: 1, speciality: "", experience: 1, equipment: "", image: "", password: "", status: "")]
    var selectedVet: VetDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        print(selectedVet ?? "not transfered")
        tableView.register(FavouriteTableViewCell.self, forCellReuseIdentifier: "Fav2Cell")
    }
//TODO
        
        override func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return favoriteVets.count
        }

        override func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Fav2Cell", for: indexPath) as! FavouriteTableViewCell
            let favoriteVet = favoriteVets[indexPath.row]
            //cell.accountImageView.kf.setImage(with: URL(string: image))
            cell.nameLabel.text = "Name: \(favoriteVet.name) "
            cell.specielityLabel.text = "Speciality: \(favoriteVet.speciality)"
            cell.statusLabel.text = "🟢"
            cell.accountImageView.image = UIImage(named: "vet")
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
            detailVC.vet = selectedVets
            navigationController?.pushViewController(detailVC, animated: true)
        }
        
        @objc func favoriteButtonTapped(_ sender: UIButton){
            let selectedIndex = sender.tag
            let selectedVetToBeSend = favoriteVets[selectedIndex]
            
            let secondVC = FavouriteViewController()
            secondVC.selectedVet = selectedVetToBeSend // the problem is here

            // TODO when i click on the favorite button it should save it to the favorite screen

        }
    }



