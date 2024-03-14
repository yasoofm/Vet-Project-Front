import Foundation
import UIKit
import Eureka

class SignInViewController: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupForm()
    }
    
    
    private func setupForm(){
        form +++ Section("Sign In")
        
        
        <<< TextRow() { row in
            row.title = "Username"
            row.placeholder = "Enter Username"
            row.tag = "username"
            row.add(rule: RuleRequired())
            row.validationOptions = .validatesOnChange
            
            row.cellUpdate{ cell, row in
                cell.titleLabel?.textColor = .orange
                if !row.isValid{
                    cell.titleLabel?.textColor = .red
                }
            }
        }
        <<< PasswordRow() { row in
            row.title = "Password"
            row.placeholder = "Enter Password"
            row.tag = "password"
            row.add(rule: RuleRequired())
            row.validationOptions = .validatesOnChange
            row.cellUpdate{ cell, row in
                cell.titleLabel?.textColor = .orange
                if !row.isValid{
                    cell.titleLabel?.textColor = .red
                    
                }
            }
        }
        
        <<< ButtonRow(){ row in
            row.title = "Sign In"
            row.tag = "signIn"
            row.onCellSelection{ cell , row in
                print("tapped")
                self.signInButtonClicked()
            }
            row.cellUpdate { cell, row in
                cell.textLabel?.textColor = .white
                cell.backgroundColor = .orange
            }
            
        }
        
    }
    
    @objc func signInButtonClicked(){
        let errors = form.validate()
        
        guard errors.isEmpty else{
            print(errors)
            presentAlertWithTitle(title: "Error❗️", message: "Some text fields are empty")
            return
        }
        
        let userNameRow: TextRow? = form.rowBy(tag: "username")
        let passwordRow: PasswordRow? = form.rowBy(tag: "password")
        
        let username = userNameRow?.value ?? ""
        let password = passwordRow?.value ?? ""
        
        var request = SigninRequest(username: username.lowercased(), password: password)
        
        NetworkManager.shared.signin(request: request) { result in
            DispatchQueue.main.async {
                switch result{
                case .success(let response):
                    let homeVC = HomeViewController()
                    homeVC.info = response
                    self.navigationController?.pushViewController(homeVC, animated: true)
                case .failure(let error):
                    print(error)
                }
            }
        }
        
        
        func presentAlertWithTitle(title: String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true, completion: nil)
        }
    }
}
