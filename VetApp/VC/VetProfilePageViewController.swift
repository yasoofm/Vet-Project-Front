import UIKit
import SnapKit

class VetProfilePageViewController: UIViewController {

    var vet: VetDetails?
    
    
    
    //let dataSource = ["Online", "Offline", "Busy"]
    let dataSource = ["⛔️", "🟡", "🟢"]
    //    let dataSource = [#colorLiteral(red: 1, green: 0, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.9484949708, blue: 0, alpha: 1), #colorLiteral(red: 0, green: 1, blue: 0, alpha: 1)]
   // var colort = #colorLiteral())

    /*
        lazy var containerView: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor.init(displayP3Red: 237/255, green: 233/255, blue: 216/255, alpha: 1.0)
            
            view.addSubview(profileImageView)
            profileImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
            profileImageView.anchor(top: view.topAnchor, paddingTop: 88,
                                   width: 120, height: 120)
            profileImageView.layer.cornerRadius = 120 / 2
            
            view.addSubview(nameLabel)
            nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            nameLabel.anchor(left: profileImageView.rightAnchor, paddingLeft: 60)
            
            view.addSubview(usernameLabel)
            usernameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 30).isActive = true
            usernameLabel.anchor(top: nameLabel.bottomAnchor, paddingTop: 10)
            
           
            return view
        }()
     */
    // var colort = #colorLiteral())
    
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(displayP3Red: 237/255, green: 233/255, blue: 216/255, alpha: 1.0)
        view.addSubview(profileImageView)
        profileImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        profileImageView.anchor(top: view.topAnchor, paddingTop: 88,
                                width: 120, height: 120)
        profileImageView.layer.cornerRadius = 120 / 2
        
        view.addSubview(nameLabel)
        nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        nameLabel.anchor(left: profileImageView.rightAnchor, paddingLeft: 60)
        
        view.addSubview(usernameLabel)
        usernameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 30).isActive = true
        usernameLabel.anchor(top: nameLabel.bottomAnchor, paddingTop: 10)
        
        
        return view
    }()
    
    let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "vet")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.borderWidth = 3
        iv.layer.borderColor = UIColor.white.cgColor
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Vet"
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textColor = .orange
        return label
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "vet123"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .orange
        return label
    }()
    let emailLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Phone Number: "
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .orange
        return label
    }()
    
    let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Phone number: "
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .orange
        return label
    }()
    
    let experienceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Experience: "
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .orange
        return label
    }()
    
    let specialityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Speciality: "
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .orange
        return label
    }()
    let equipmentLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Equipment: "
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .orange
        return label
    }()
    
    let logoutButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(containerView)
        view.addSubview(emailLabel)
        view.addSubview(phoneNumberLabel)
        view.addSubview(experienceLabel)
        view.addSubview(specialityLabel)
        view.addSubview(equipmentLabel)
        view.addSubview(logoutButton)
        
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        logoutButton.setTitle("Logout", for: .normal)
        AutoLayout()
        applyGradientBackground()
        
        let button = UIButton(primaryAction: nil)
        
        let actionClosure = { (action: UIAction) in
            print(action.title)
        }
        
        var menuChildren: [UIMenuElement] = []
        for status in dataSource {
            let attributedTitle = NSAttributedString(string: status, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 100)])
            menuChildren.append(UIAction(title: status, handler: actionClosure))
            
        }
        
        button.menu = UIMenu(options: .displayAsPalette, children: menuChildren)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.backgroundColor = .white
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.showsMenuAsPrimaryAction = true
        button.changesSelectionAsPrimaryAction = true
        button.frame = CGRect(x: 95, y: 177, width: 40, height: 40)
        self.view.addSubview(button)
    }
    
    func AutoLayout(){
        
        containerView.anchor(top: view.topAnchor, left: view.leftAnchor,
                             right: view.rightAnchor, height: 280)
        emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        emailLabel.anchor(top: containerView.bottomAnchor, paddingTop: 50)
        
        phoneNumberLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        phoneNumberLabel.anchor(top: emailLabel.bottomAnchor, paddingTop: 40)
        
        experienceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        experienceLabel.anchor(top: phoneNumberLabel.bottomAnchor, paddingTop: 40)
        
        specialityLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        specialityLabel.anchor(top: experienceLabel.bottomAnchor, paddingTop: 40)
        
        equipmentLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        equipmentLabel.anchor(top: specialityLabel.bottomAnchor, paddingTop: 40)
        
        logoutButton.backgroundColor = .orange
        logoutButton.setTitleColor(.white, for: .normal)
        logoutButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        logoutButton.layer.cornerRadius = 20
        
        logoutButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(40)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(300)
        }
    }
    
    func applyGradientBackground() {
        let gradientLayer = CAGradientLayer()
        let customColor = UIColor(red: 255/255, green: 165/255, blue: 0/255, alpha: 0.0)
        gradientLayer.colors = [customColor.cgColor, UIColor.systemMint.cgColor]
        gradientLayer.locations = [0.0, 9.0]
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    @objc func logoutButtonTapped(){        navigationController?.setViewControllers([WelcomePageViewController()], animated: true)
    }
    
}

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, paddingTop: CGFloat? = 0,
                paddingLeft: CGFloat? = 0, paddingBottom: CGFloat? = 0, paddingRight: CGFloat? = 0, width: CGFloat? = nil, height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop!).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft!).isActive = true
        }
        
        if let bottom = bottom {
            if let paddingBottom = paddingBottom {
                bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
            }
        }
        
        if let right = right {
            if let paddingRight = paddingRight {
                rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
            }
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}







