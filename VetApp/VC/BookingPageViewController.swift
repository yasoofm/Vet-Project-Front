import UIKit

class BookingPageViewController: UIViewController {
    
    let textField = UITextField()
    let titleLabel = UILabel()
    let bookButton = UIButton()
    let consultationAmountLabel = UILabel()
    let cashButton = UIButton(type: .system)
    let cardButton = UIButton(type: .system)
    let payButton = UIButton()
    
    var selectedButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(textField)
        view.addSubview(consultationAmountLabel)
        view.addSubview(cashButton)
        view.addSubview(cardButton)
        view.addSubview(payButton)
        
        setupViews()
        setupLayout()
        applyGradientBackground()
    }
    
    
    func setupViews(){
        view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
        titleLabel.text = "Booking Summary"
        titleLabel.textColor = .orange
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24.0)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        consultationAmountLabel.text = "Consultation Price: \t\t\t\t 5 KD"
        consultationAmountLabel.font = UIFont.systemFont(ofSize: 18.0, weight: .semibold)
        consultationAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        consultationAmountLabel.textAlignment = .left
        
        cashButton.setTitle("💵 Cash", for: .normal)
        cashButton.setTitleColor(.black, for: .normal)
        cashButton.layer.cornerRadius = 8.0
        cashButton.layer.borderWidth = 1.0
        cashButton.layer.borderColor = UIColor.lightGray.cgColor
        cashButton.addTarget(self, action: #selector(cashButtonPressed), for: .touchUpInside)
        cashButton.translatesAutoresizingMaskIntoConstraints = false
        
        cardButton.setTitle("💳 Card", for: .normal)
        cardButton.setTitleColor(.black, for: .normal)
        cardButton.layer.cornerRadius = 8.0
        cardButton.layer.borderWidth = 1.0
        cardButton.layer.borderColor = UIColor.lightGray.cgColor
        cardButton.addTarget(self, action: #selector(cardButtonPressed), for: .touchUpInside)
        cardButton.translatesAutoresizingMaskIntoConstraints = false
        
        payButton.setTitle("Pay", for: .normal)
        payButton.backgroundColor = .orange
        payButton.layer.cornerRadius = 25
        payButton.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 20)
        payButton.addTarget(self, action: #selector(payButtonTapped), for: .touchUpInside)
        
    }
    func setupLayout(){
        
        textField.placeholder = " Enter animal type..."
        textField.borderStyle = .none
        textField.layer.cornerRadius = 20
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.lightGray.cgColor
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 270),
            textField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            textField.heightAnchor.constraint(equalToConstant: 40),
            
            consultationAmountLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 140),
            consultationAmountLabel.centerXAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 180),
            
            cashButton.topAnchor.constraint(equalTo: consultationAmountLabel.bottomAnchor, constant: 30),
            cashButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            cashButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            cashButton.heightAnchor.constraint(equalToConstant: 50),
            
            cardButton.topAnchor.constraint(equalTo: cashButton.bottomAnchor, constant: 15),
            cardButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            cardButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            cardButton.heightAnchor.constraint(equalToConstant: 40),
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100)
            
        ])
        payButton.snp.makeConstraints { make in
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
    
    @objc func payButtonTapped(){
     //TODO when i click n pay it hould save in request screen
        let alertController = UIAlertController(title: "Booking confirmed!", message: "Your booking has been successfully confirmed ", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default) { _ in
            alertController.dismiss(animated: true, completion: nil)
            self.navigationController?.popToRootViewController(animated: true)
        }
        alertController.addAction(okAction)
        alertController.view.alpha = 0
        UIView.animate(withDuration: 0.5, animations: { alertController.view.alpha = 1})
        present(alertController, animated: true, completion: nil)
    }
    
    @objc func cashButtonPressed() {
        selectButton(button: cashButton)
    }
    
    @objc func cardButtonPressed() {
        selectButton(button: cardButton)
    }
    
    func selectButton(button: UIButton) {
        selectedButton?.backgroundColor = .white
        button.backgroundColor = .lightGray
        selectedButton = button
    }
}



