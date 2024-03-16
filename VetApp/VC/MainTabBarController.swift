import UIKit


// UserDefaults

class MainTabBarController: UITabBarController {

    var info: SignInResponse?
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        setupViewControllers()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // setupViewControllers()
        
        tabBar.tintColor = .orange
        tabBar.unselectedItemTintColor = .orange
        navigationItem.hidesBackButton = true
    }
    
    func setupViewControllers() {
        
        let homeViewController = HomeViewController()
        homeViewController.token = info?.token
        homeViewController.id = info?.id
        homeViewController.name = info?.name
        homeViewController.role = info?.role
        homeViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        homeViewController.tabBarItem = UITabBarItem(title: "home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
        let favouriteViewController = FavouriteViewController()
        favouriteViewController.token = info?.token
        favouriteViewController.role = info?.role
        favouriteViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        favouriteViewController.tabBarItem = UITabBarItem(title: "favourite", image: UIImage(systemName: "heart"), selectedImage: UIImage(systemName: "heart.fill"))
        
        let myRequestViewController = MyRequestViewController()
        myRequestViewController.token = info?.token
        myRequestViewController.role = info?.role
        myRequestViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        myRequestViewController.tabBarItem = UITabBarItem(title: "requests", image: UIImage(systemName: "arrow.down.message"), selectedImage: UIImage(systemName: "arrow.down.message.fill"))
        
        var profileViewController: UIViewController?
        if info?.role == "user" {
            let userProfileViewController = UserProfilePageViewController()
            userProfileViewController.username = info?.username
            userProfileViewController.email = info?.email
            userProfileViewController.phoneNumber = info?.phoneNumber
            userProfileViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
            userProfileViewController.tabBarItem = UITabBarItem(title: "user profile", image: UIImage(systemName: "person.crop.circle"), selectedImage: UIImage(systemName: "person.crop.circle.fill"))
            profileViewController = userProfileViewController
        } else {
            let vetProfileViewController = VetProfilePageViewController()
            vetProfileViewController.email = info?.email
            vetProfileViewController.username = info?.username
            vetProfileViewController.image = info?.image
            vetProfileViewController.experience = info?.experience
            vetProfileViewController.name = info?.name
            vetProfileViewController.equipment = info?.equipment
            vetProfileViewController.phoneNumber = info?.phoneNumber
            vetProfileViewController.speciality = info?.speciality
            vetProfileViewController.token = info?.token
            vetProfileViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
            vetProfileViewController.tabBarItem = UITabBarItem(title: "vet profile", image: UIImage(systemName: "person.crop.circle"), selectedImage: UIImage(systemName: "person.crop.circle.fill"))
            profileViewController = vetProfileViewController
        }
        viewControllers = [homeViewController, favouriteViewController,  myRequestViewController, profileViewController ?? UserProfilePageViewController()]
    }
}
