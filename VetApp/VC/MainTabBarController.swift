import UIKit

class MainTabBarController: UITabBarController {
    
    var role: String? = "user"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        
        tabBar.tintColor = .orange
        tabBar.unselectedItemTintColor = .orange
        
    }
    
    func setupViewControllers() {
        
        let homeViewController = HomeViewController()
        homeViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        
        homeViewController.tabBarItem = UITabBarItem(title: "home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
        let favouriteViewController = FavouriteViewController()
        favouriteViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        favouriteViewController.tabBarItem = UITabBarItem(title: "favourite", image: UIImage(systemName: "heart"), selectedImage: UIImage(systemName: "heart.fill"))
        
        let myRequestViewController = MyRequestViewController()
        myRequestViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        myRequestViewController.tabBarItem = UITabBarItem(title: "requests", image: UIImage(systemName: "arrow.down.message"), selectedImage: UIImage(systemName: "arrow.down.message.fill"))
        
        var profileViewController: UIViewController?
        if role == "user" {
            profileViewController = UserProfilePageViewController()
            profileViewController?.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
            profileViewController?.tabBarItem = UITabBarItem(title: "user profile", image: UIImage(systemName: "person.crop.circle"), selectedImage: UIImage(systemName: "person.crop.circle.fill"))
        } else {
            profileViewController = VetProfilePageViewController()
            profileViewController?.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
            profileViewController?.tabBarItem = UITabBarItem(title: "vet profile", image: UIImage(systemName: "person.crop.circle"), selectedImage: UIImage(systemName: "person.crop.circle.fill"))
        }
        viewControllers = [homeViewController, favouriteViewController,  myRequestViewController, profileViewController ?? UserProfilePageViewController()]
    }
}
