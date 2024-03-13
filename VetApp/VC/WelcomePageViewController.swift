import UIKit
import SnapKit

class WelcomePageViewController: UIViewController {
    
    var logoImage = UIImageView()
    var signInButton = UIButton()
    var signUpUserButton = UIButton()
    var signUpVetButton = UIButton()
    let welcomeLabel = UILabel()
    let vetClincLabel = UILabel()
    
    
    override func viewDidLoad() {
        
        view.backgroundColor = .white
        
        super.viewDidLoad()
        
        view.addSubview(logoImage)
        view.addSubview(signInButton)
        view.addSubview(signUpUserButton)
        view.addSubview(signUpVetButton)
        view.addSubview(welcomeLabel)
        view.addSubview(vetClincLabel)
        
        setupUI()
        setupConstraints()
        applyGradientBackground()
        
        signInButton.addTarget(self, action: #selector(signInButtonClicked), for: .touchUpInside)
        signUpUserButton.addTarget(self, action: #selector(signUpUserButtonClicked), for: .touchUpInside)
        signUpVetButton.addTarget(self, action: #selector(signUpVetButtonClicked), for: .touchUpInside)
        
    }
    
    
    func setupUI(){
        
        welcomeLabel.text = "Welcome to"
        welcomeLabel.textColor = .black
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 50)
        welcomeLabel.textAlignment = .center
        
        vetClincLabel.text = "our veterinarians"
        vetClincLabel.textColor = .orange
        vetClincLabel.font = UIFont.boldSystemFont(ofSize: 35)
        vetClincLabel.textAlignment = .center
        
        logoImage.image = UIImage(named: "logovet")
        logoImage.layer.cornerRadius = logoImage.frame.height
        logoImage.layer.cornerRadius = 12
        
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.setTitleColor(.orange, for: .normal)
        signInButton.backgroundColor = UIColor.white
        signInButton.layer.borderWidth = 1
        signInButton.layer.borderColor = UIColor.black.cgColor
        signInButton.layer.cornerRadius = 8
        
        signUpUserButton.setTitle("Sign Up", for: .normal)
        signUpUserButton.setTitleColor(.orange, for: .normal)
        signUpUserButton.backgroundColor = UIColor.white
        signUpUserButton.layer.borderWidth = 1
        signUpUserButton.layer.borderColor = UIColor.black.cgColor
        signUpUserButton.layer.cornerRadius = 8
        
        signUpVetButton.setTitle("Create a Vet Account", for: .normal)
        signUpVetButton.setTitleColor(.black, for: .normal)
        signUpVetButton.backgroundColor = UIColor.white
        signUpVetButton.layer.cornerRadius = 8
        signUpVetButton.backgroundColor = .orange
    }
    
    func setupConstraints(){
        
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.centerX.equalToSuperview()
        }
        vetClincLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(welcomeLabel.snp.bottom)
        }
        logoImage.snp.makeConstraints { make in
            make.top.equalTo(vetClincLabel.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(280)
            make.height.equalTo(230)
        }
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(65)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(30)
        }
        signUpUserButton.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(30)
        }
        signUpVetButton.snp.makeConstraints { make in
            make.top.equalTo(signUpUserButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(280)
            make.height.equalTo(50)
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
    
    @objc func signInButtonClicked(){
        let secondVC = SignInViewController()
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    @objc func signUpUserButtonClicked(){
        let thirdVC = SignUpUserViewController()
        self.navigationController?.pushViewController(thirdVC, animated: true)
    }
    
    @objc func signUpVetButtonClicked(){
        let fourthVC = SignUpVetViewController()
        self.navigationController?.pushViewController(fourthVC, animated: true)
    }
}
