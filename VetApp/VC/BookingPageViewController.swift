//import UIKit
//
//class BookingPageViewController: UIViewController {
//    
//    let textField = UITextField()
//    let titleLabel = UILabel()
//    let bookButton = UIButton()
//    let consultationAmountLabel = UILabel()
//    let cashButton = UIButton(type: .system)
//    let cardButton = UIButton(type: .system)
//    
//    var selectedButton: UIButton?
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        view.backgroundColor = .white
//        view.addSubview(titleLabel)
//        view.addSubview(textField)
//        view.addSubview(consultationAmountLabel)
//        view.addSubview(cashButton)
//        view.addSubview(cardButton)
//        
//        setupLayout()
//        autoLayout()
//    }
//    func setupLayout(){
//        
//        titleLabel.text = "Booking Summary"
//        titleLabel.font = UIFont.boldSystemFont(ofSize: 24.0)
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        
//        consultationAmountLabel.text = "Consultation Price: \t\t\t\t 5 KD"
//        consultationAmountLabel.font = UIFont.systemFont(ofSize: 18.0, weight: .semibold)
//        consultationAmountLabel.translatesAutoresizingMaskIntoConstraints = false
//        consultationAmountLabel.textAlignment = .left
//        
//        cashButton.setTitle("💵 Cash", for: .normal)
//        cashButton.setTitleColor(.black, for: .normal)
//        cashButton.layer.cornerRadius = 8.0
//        cashButton.layer.borderWidth = 1.0
//        cashButton.layer.borderColor = UIColor.lightGray.cgColor
//        cashButton.addTarget(self, action: #selector(cashButtonPressed), for: .touchUpInside)
//        cashButton.translatesAutoresizingMaskIntoConstraints = false
//        
//        
//        cardButton.setTitle("💳 Card", for: .normal)
//        cardButton.setTitleColor(.black, for: .normal)
//        cardButton.layer.cornerRadius = 8.0
//        cardButton.layer.borderWidth = 1.0
//        cardButton.layer.borderColor = UIColor.lightGray.cgColor
//        cardButton.addTarget(self, action: #selector(cardButtonPressed), for: .touchUpInside)
//        cardButton.translatesAutoresizingMaskIntoConstraints = false
//        
//    }
//    
//    func autoLayout(){
//        
//        textField.placeholder = " Enter animal type..."
//        textField.borderStyle = .none
//        textField.layer.cornerRadius = 20
//        textField.layer.borderWidth = 1.0
//        textField.layer.borderColor = UIColor.lightGray.cgColor
//        
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            textField.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 270),
//            textField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
//            textField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
//            textField.heightAnchor.constraint(equalToConstant: 40),
//     
//            consultationAmountLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 140),
//            consultationAmountLabel.centerXAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 180),
//            
//            cashButton.topAnchor.constraint(equalTo: consultationAmountLabel.bottomAnchor, constant: 30),
//            cashButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
//            cashButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
//            cashButton.heightAnchor.constraint(equalToConstant: 50),
//            
//            cardButton.topAnchor.constraint(equalTo: cashButton.bottomAnchor, constant: 15),
//            cardButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
//            cardButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
//            cardButton.heightAnchor.constraint(equalToConstant: 40),
//            
//            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
//            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100)
//                
//        ])
//    }
//    
//    @objc func cashButtonPressed() {
//        selectButton(button: cashButton)
//    }
//    
//    @objc func cardButtonPressed() {
//        selectButton(button: cardButton)
//    }
//    
//    func selectButton(button: UIButton) {
//        selectedButton?.backgroundColor = .white
//        
//        button.backgroundColor = .lightGray
//        selectedButton = button
//    }
//}
//
