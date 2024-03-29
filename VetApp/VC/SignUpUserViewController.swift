import UIKit
import Eureka

class SignUpUserViewController: FormViewController {
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            view.backgroundColor = .white
            setupForm()
            
        }
        
        private func setupForm(){
            form +++ Section ("Sign Up As A User")
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
            <<< EmailRow() { row in
                row.title = "Email"
                row.placeholder = "Enter Email"
                row.tag = "email"
                row.add(rule: RuleRequired())
                row.validationOptions = .validatesOnChange
                
                row.cellUpdate{ cell, row in
                    cell.titleLabel?.textColor = .orange
                    if !row.isValid{
                        cell.titleLabel?.textColor = .red
                    }
                }
            }
            <<< PhoneRow() { row in
                row.title = "Phone Number"
                row.placeholder = "Enter Phone Number"
                row.tag = "phoneNumber"
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
                row.title = "Sign Up"
                row.tag = "signup"
                row.onCellSelection{ cell , row in
                    print("tapped")
                    self.SignUpUserButtonClicked()
                }
                row.cellUpdate { cell, row in
                    cell.textLabel?.textColor = .white
                    cell.backgroundColor = .orange
                }
            }
        }
        
        @objc func SignUpUserButtonClicked(){
            
            let errors = form.validate()
            
            guard errors.isEmpty else{
                print(errors)
                presentAlertWithTitle(title: "Error", message: "Some text fields are empty.")
                return
            }
            
            let userNameRow: TextRow? = form.rowBy(tag: "username")
            let emailRow: EmailRow? = form.rowBy(tag: "email")
            let phoneNumberRow: PhoneRow? = form.rowBy(tag: "phoneNumber")
            let passwordRow: PasswordRow? = form.rowBy(tag: "password")
            
            let username = userNameRow?.value ?? ""
            let email = emailRow?.value ?? ""
            let phoneNumber = phoneNumberRow?.value ?? ""
            let password = passwordRow?.value ?? ""
            
            let userRequest = UserSignupRequest(username: username, email: email, phoneNumber: Int64(phoneNumber) ?? 0, password: password)
            print(username)
            print(email)
            print(phoneNumber)
            print(password)
            NetworkManager.shared.signUpUser(userSignupRequest: userRequest) { success in
                DispatchQueue.main.async {
                    switch success {
                    case .success(let signInResponse):
                        print("Sign up successful. Token: \(signInResponse.token)")
                        
                        let mainVC = MainTabBarController()
                        mainVC.info = signInResponse
                        self.navigationController?.pushViewController(mainVC, animated: true)
                    case .failure(let error):
                        print(error.localizedDescription)
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


