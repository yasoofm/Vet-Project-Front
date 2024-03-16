import UIKit
import SnapKit

class VetDetailsViewController: UIViewController {
    
    var vet: VetDetails?
    var token: String?
    var role: String?
    
    private let nameLabel = UILabel()
    private let emailLabel = UILabel()
    private let phoneNumberLabel = UILabel()
    private let imageView = UIImageView()
    private let yearsOfExperienceLabel = UILabel()
    private let specielityLabel = UILabel()
    private let equipmentsLabel = UILabel()
    private let bookButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(nameLabel)
        view.addSubview(emailLabel)
        view.addSubview(phoneNumberLabel)
        view.addSubview(imageView)
        view.addSubview(yearsOfExperienceLabel)
        view.addSubview(specielityLabel)
        view.addSubview(equipmentsLabel)
        view.addSubview(bookButton)
        
        setupViews()
        setupLayout()
        configureWithVets()
        applyGradientBackground()
    }
    
    func setupViews(){
        view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
        
        bookButton.setTitle("Book", for: .normal)
        bookButton.backgroundColor = .orange
        bookButton.layer.cornerRadius = 25
        bookButton.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 20)
        bookButton.addTarget(self, action: #selector(bookButtonTapped), for: .touchUpInside)
        nameLabel.font = UIFont(name: "Helvetica-Bold", size: 20)
        nameLabel.textColor = .orange
        emailLabel.font = UIFont(name: "Helvetica", size: 18)
        emailLabel.textColor = .darkGray
        phoneNumberLabel.font = UIFont(name: "Helvetica", size: 18)
        phoneNumberLabel.textColor = .darkGray
        yearsOfExperienceLabel.font = UIFont(name: "Helvetica", size: 18)
        yearsOfExperienceLabel.textColor = .darkGray
        specielityLabel.font = UIFont(name: "Helvetica", size: 18)
        specielityLabel.textColor = .darkGray
        equipmentsLabel.font = UIFont(name: "Helvetica", size: 18)
        equipmentsLabel.textColor = .darkGray

    }
    
    func setupLayout(){
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview()
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        phoneNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        yearsOfExperienceLabel.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        specielityLabel.snp.makeConstraints { make in
            make.top.equalTo(yearsOfExperienceLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        equipmentsLabel.snp.makeConstraints { make in
            make.top.equalTo(specielityLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        bookButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(20)
            make.width.equalTo(200)
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

    
    @objc func bookButtonTapped(){
        let bookingVC = BookingPageViewController()
        bookingVC.vet = self.vet
        bookingVC.role = self.role
        bookingVC.token = self.token
        navigationController?.pushViewController(bookingVC, animated: true)
    }
    
    func configureWithVets(){
        //    imageView.kf.setImage(with: URL(string: vet.image))
        imageView.image = UIImage(named: "userimage")
        nameLabel.text = "Name: \(vet?.name ?? "Empty")"
//        usernameLabel.text = "User name: \(vet?.username ?? "Empty")"
        emailLabel.text = "Email: \(vet?.email ?? "Empty")"
        phoneNumberLabel.text = " Phone number: \(String(vet?.phoneNumber ?? 0))"
        yearsOfExperienceLabel.text = " Years of experiemnce: \(String(vet?.experience ?? 0))"
        specielityLabel.text = "Specielity: \(vet?.speciality ?? "Empty")"
        equipmentsLabel.text = " Available Equipments: \(vet?.equipment ?? "Empty")"
    }
}

