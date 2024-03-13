import UIKit
import Alamofire
import SnapKit
import Kingfisher

class HomeViewController: UITableViewController {
    
    var token: String?

    var vets: [VetDetails] = [VetDetails(name: "", username: "", email: "", phoneNumber: 1, specialty: "", experience: 1, equipment: "", image: "", password: "", status: "")]
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        tableView.register(Home2TableViewCell.self, forCellReuseIdentifier: "Home2Cell")
    }
    
    override func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vets.count
    }

    override func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Home2Cell", for: indexPath) as! Home2TableViewCell
        let vet = vets[indexPath.row]
        cell.accountImageView.kf.setImage(with: URL(string: vet.image))
        cell.nameLabel.text = "Name: \(vet.name) "
        cell.specielityLabel.text = " \(vet.specialty)"
        cell.statusLabel.text = "\(vet.status)"
        cell.accountImageView.image = UIImage(named: "\(vet.image)")
        cell.favoriteButton.tag = indexPath.row
        cell.favoriteButton.addTarget(self, action: #selector(favoriteButtonTapped(_:)), for: .touchUpInside)

        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = VetDetailsViewController()
        let selectedVets = vets[indexPath.row]
        detailVC.vet = selectedVets
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    @objc func favoriteButtonTapped(_ sender: UIButton){
        let selectedIndex = sender.tag
        let selectedVetToBeSend = vets[selectedIndex]
        
        let secondVC = FavouriteViewController()
        secondVC.selectedVet = selectedVetToBeSend // the problem is here

        // TODO when i click on the favorite button it should save it to the favorite screen

    }
}

