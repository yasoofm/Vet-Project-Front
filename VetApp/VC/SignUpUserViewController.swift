//
//  SignUpUserViewController.swift
//  VetApp
//
//  Created by Nada Alshaibani on 12/03/2024.
//

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
                    if !row.isValid{
                        cell.titleLabel?.textColor = .red
                    }
                }
            }
            <<< IntRow() { row in
                row.title = "Phone Number"
                row.placeholder = "Enter Phone Number"
                row.tag = "phoneNumber"
                row.add(rule: RuleRequired())
                row.validationOptions = .validatesOnChange
                
                row.cellUpdate{ cell, row in
                    if !row.isValid{
                        cell.titleLabel?.textColor = .red
                    }
                }
            }
            <<< TextRow() { row in
                row.title = "Password"
                row.placeholder = "Enter Password"
                row.tag = "password"
                row.add(rule: RuleRequired())
                row.validationOptions = .validatesOnChange
                
                row.cellUpdate{ cell, row in
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
            let phoneNumberRow: IntRow? = form.rowBy(tag: "phoneNumber")
            let passwordRow: PasswordRow? = form.rowBy(tag: "password")
            
            let username = userNameRow?.value ?? ""
            let email = emailRow?.value ?? ""
            let phoneNumber = phoneNumberRow?.value ?? 00
            let password = passwordRow?.value ?? ""
            
            let user = User(id: nil, userName: username, email: email, role: nil, token: nil, phoneNumber: Int64(phoneNumber), password: password)
            
            NetworkManager.shared.signUpUser(user: user) { success in
                DispatchQueue.main.async {
                    switch success {
                    case .success(let signInResponse):
                        print("Sign up successful. Token: \(signInResponse.token)")
                        
                        let HomeVC = HomeViewController()
                        HomeVC.token = signInResponse.token
                        self.navigationController?.pushViewController(HomeVC, animated: true)
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


