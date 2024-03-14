//
//  SignUpViewController.swift
//  VetApp
//
//  Created by Nada Alshaibani on 12/03/2024.
//

import UIKit
import Eureka

class SignUpVetViewController: FormViewController {
    override func viewDidLoad() {
            super.viewDidLoad()
            
            view.backgroundColor = .white
            setupForm()
        }
        

        private func setupForm(){
            form +++ Section("Sign Up As A Vet")
            <<< TextRow() { row in
                row.title = "Name"
                row.placeholder = "Enter Name"
                row.tag = "name"
                row.add(rule: RuleRequired())
                row.validationOptions = .validatesOnChange
                
                row.cellUpdate{ cell, row in
                    if !row.isValid{
                        cell.titleLabel?.textColor = .red
                    }
                }
            }
            
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
                row.title = "Speciality"
                row.placeholder = "Enter Speciality"
                row.tag = "speciality"
                row.add(rule: RuleRequired())
                row.validationOptions = .validatesOnChange
                
                row.cellUpdate{ cell, row in
                    if !row.isValid{
                        cell.titleLabel?.textColor = .red
                    }
                }
            }
            
            <<< IntRow() { row in
                row.title = "Years Of Experience"
                row.placeholder = "Enter Years Of Experience"
                row.tag = "yearsOfExperience"
                row.add(rule: RuleRequired())
                row.validationOptions = .validatesOnChange
                
                row.cellUpdate{ cell, row in
                    if !row.isValid{
                        cell.titleLabel?.textColor = .red
                    }
                }
            }
            
            <<< TextRow() { row in
                row.title = "Speciality"
                row.placeholder = "Enter Speciality"
                row.tag = "speciality"
                row.add(rule: RuleRequired())
                row.validationOptions = .validatesOnChange
                
                row.cellUpdate{ cell, row in
                    if !row.isValid{
                        cell.titleLabel?.textColor = .red
                    }
                }
            }
            
            <<< TextRow() { row in
                row.title = "Image"
                row.placeholder = "Enter the image URL"
                row.tag = "image"
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
                    self.SignUpVetButtonClicked()
                }
            }
        }
        
        @objc func SignUpVetButtonClicked(){
            let errors = form.validate()
            
            guard errors.isEmpty else{
                print(errors)
                presentAlertWithTitle(title: "Error", message: "Some text fields are empty.")
                return
            }
            
            let nameRow: TextRow? = form.rowBy(tag: "name")
            let userNameRow: TextRow? = form.rowBy(tag: "username")
            let emailRow: EmailRow? = form.rowBy(tag: "email")
            let phoneNumberRow: IntRow? = form.rowBy(tag: "phoneNumber")
            let specialityRow: TextRow? = form.rowBy(tag: "speciality")
            let yearsOfExperienceRow: IntRow? = form.rowBy(tag: "yearsOfExperience")
            let equipmentRow: TextRow? = form.rowBy(tag: "equipment")
            let imageRow: TextRow? = form.rowBy(tag: "image")
            let passwordRow: PasswordRow? = form.rowBy(tag: "password")
            
            let name = nameRow?.value ?? ""
            let username = userNameRow?.value ?? ""
            let email = emailRow?.value ?? ""
            let phoneNumber = phoneNumberRow?.value ?? 00
            let speciality = specialityRow?.value ?? ""
            let yearsOfExperience = yearsOfExperienceRow?.value ?? 00
            let equipment = equipmentRow?.value ?? ""
            let image = imageRow?.value ?? ""
            let password = passwordRow?.value ?? ""
            
            let vet = VetDetails(id: nil, name: name, username: username, email: email, phoneNumber: Int64(phoneNumber), specialty: speciality, experience: yearsOfExperience, equipment: equipment, image: image, password: password)
            
            
            NetworkManager.shared.signUpVet(vet: vet) { success in
                DispatchQueue.main.async {
                    switch success {
                    case .success(let response):
                        print("Sign up successful. Token: \(response.token)")
                        
                        let HomeVC = HomeViewController()
                        HomeVC.info = response
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
