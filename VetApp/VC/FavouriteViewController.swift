import UIKit

class FavouriteViewController: UIViewController {
    
    var favoriteVets: [VetDetails] = [ ]
    var selectedVet: VetDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        print(selectedVet ?? "not transfered")
//        if let selectedVet = selectedVet{
//            favoriteVets.append(selectedVet)
//        }
    }
}
