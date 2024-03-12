import UIKit
import SnapKit

class VetDetailsViewController: UIViewController {
    
    var vet: VetDetails?
    
    let nameLabel = UILabel()
    let usernameLabel = UILabel()
    let emailLabel = UILabel()
    let phoneNumberLabel = UILabel()
    let imageView = UIImageView()
    let yearsOfExperienceLabel = UILabel()
    let specielityLabel = UILabel()
    let equipmentsLabel = UILabel()
    let bookButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(nameLabel)
        view.addSubview(usernameLabel)
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
    }
    
    func setupViews(){
        view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
        
        bookButton.setTitle("Book", for: .normal)
        bookButton.backgroundColor = .gray
        bookButton.layer.cornerRadius = 25
        bookButton.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 20)
        bookButton.addTarget(self, action: #selector(bookButtonTapped), for: .touchUpInside)
        
        nameLabel.font = UIFont(name: "Helvetica-Bold", size: 18)
        nameLabel.textColor = .black
        
        usernameLabel.font = UIFont(name: "Helvetica", size: 16)
        usernameLabel.textColor = .darkGray
        
        emailLabel.font = UIFont(name: "Helvetica", size: 16)
        emailLabel.textColor = .darkGray
        
        phoneNumberLabel.font = UIFont(name: "Helvetica", size: 16)
        phoneNumberLabel.textColor = .darkGray
        
        yearsOfExperienceLabel.font = UIFont(name: "Helvetica", size: 16)
        yearsOfExperienceLabel.textColor = .darkGray
        
        specielityLabel.font = UIFont(name: "Helvetica", size: 16)
        specielityLabel.textColor = .darkGray
    
        
        equipmentsLabel.font = UIFont(name: "Helvetica", size: 16)
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
        usernameLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(usernameLabel.snp.bottom).offset(20)
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
    
    @objc func bookButtonTapped(){
        let bookingVC = BookingPageViewController()
        navigationController?.pushViewController(bookingVC, animated: true)
    }
    
    func configureWithVets(){
        //    imageView.kf.setImage(with: URL(string: vet.image))
        imageView.image = UIImage(named: "userimage")
        nameLabel.text = "Name: \(vet?.name ?? "Empty")"
        usernameLabel.text = "User name: \(vet?.username ?? "Empty")"
        emailLabel.text = "Email: \(vet?.email ?? "Empty")"
        phoneNumberLabel.text = " Phone number: \(String(vet?.phoneNumber ?? 0))"
        yearsOfExperienceLabel.text = " Years of experiemnce: \(String(vet?.experience ?? 0))"
        specielityLabel.text = "Specielity: \(vet?.specialty ?? "Empty")"
        equipmentsLabel.text = " Available Equipments: \(vet?.equipment ?? "Empty")"
        
        
    }
}

