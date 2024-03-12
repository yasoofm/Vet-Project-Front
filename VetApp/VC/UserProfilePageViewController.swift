import UIKit

class UserProfilePageViewController: UIViewController {
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(displayP3Red: 237/255, green: 233/255, blue: 216/255, alpha: 1.0)
        
        view.addSubview(profileImageView)
        profileImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        profileImageView.myanchor(top: view.topAnchor, paddingTop: 88,
                                  width: 120, height: 120)
        profileImageView.layer.cornerRadius = 120 / 2
        
        view.addSubview(usernameLabel)
        usernameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 30).isActive = true
        usernameLabel.myanchor(left: profileImageView.rightAnchor, paddingLeft: 60)
        
        
        return view
    }()
    
    let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "profile")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.borderWidth = 3
        iv.layer.borderColor = UIColor.white.cgColor
        return iv
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "vet123"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    let emailLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Email: "
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Phone Number: "
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    let logoutButton = UIButton(type: .system)
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(containerView)
        view.addSubview(emailLabel)
        view.addSubview(phoneNumberLabel)
        view.addSubview(logoutButton)
        logoutButton.setTitle("Logout", for: .normal)
        AutoLayout()
        
    }
    
    func AutoLayout(){
        
        containerView.myanchor(top: view.topAnchor, left: view.leftAnchor,
                               right: view.rightAnchor, height: 280)
        emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        emailLabel.myanchor(top: containerView.bottomAnchor, paddingTop: 50)
        
        phoneNumberLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        phoneNumberLabel.myanchor(top: emailLabel.bottomAnchor, paddingTop: 40)
        
        logoutButton.backgroundColor = .red
        logoutButton.setTitleColor(.black, for: .normal)
        logoutButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        logoutButton.layer.cornerRadius = 20
        
        logoutButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(40)
            // make.leading.trailing.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(300)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}

extension UIView {
    
    func myanchor(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, paddingTop: CGFloat? = 0,
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







