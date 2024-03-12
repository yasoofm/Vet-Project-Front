//
//  WelcomePageViewController.swift
//  VetApp
//
//  Created by Nada Alshaibani on 12/03/2024.
//

import UIKit
import SnapKit

class WelcomePageViewController: UIViewController {

        var logoImage = UIImageView()
        var signInButton = UIButton()
        var signUpUserButton = UIButton()
        var signUpVetButton = UIButton()
        
        
        override func viewDidLoad() {
            
            view.backgroundColor = .white
            
            super.viewDidLoad()
            
            view.addSubview(logoImage)
            view.addSubview(signInButton)
            view.addSubview(signUpUserButton)
            view.addSubview(signUpVetButton)
            
            setupUI()
            setupConstraints()
            
            signInButton.addTarget(self, action: #selector(signInButtonClicked), for: .touchUpInside)
            signUpUserButton.addTarget(self, action: #selector(signUpUserButtonClicked), for: .touchUpInside)
            signUpVetButton.addTarget(self, action: #selector(signUpVetButtonClicked), for: .touchUpInside)
        }
        
        
        func setupUI(){
            logoImage.image = UIImage(named: "pet-store-logo-design")
            logoImage.layer.borderWidth = 2
            logoImage.layer.borderColor = UIColor.lightGray.cgColor
            logoImage.layer.cornerRadius = logoImage.frame.height / 2
            
            
            
            signInButton.setTitle("Sign In", for: .normal)
            signInButton.setTitleColor(.black, for: .normal)
            
            signInButton.backgroundColor = UIColor.white
            
            signInButton.layer.borderWidth = 1
            signInButton.layer.borderColor = UIColor.black.cgColor
            signInButton.layer.cornerRadius = 8
            
            
            
            signUpUserButton.setTitle("Sign Up", for: .normal)
            signUpUserButton.setTitleColor(.black, for: .normal)
            
            signUpUserButton.backgroundColor = UIColor.white
            
            signUpUserButton.layer.borderWidth = 1
            signUpUserButton.layer.borderColor = UIColor.black.cgColor
            signUpUserButton.layer.cornerRadius = 8
            
            
            
            signUpVetButton.setTitle("Create a Vet Account", for: .normal)
            signUpVetButton.setTitleColor(.black, for: .normal)
            
            
            signUpVetButton.backgroundColor = UIColor.white
            
            signUpVetButton.layer.borderWidth = 1
            signUpVetButton.layer.borderColor = UIColor.black.cgColor
            signUpVetButton.layer.cornerRadius = 8
            
            
        }
        
        func setupConstraints(){
            
            signUpVetButton.snp.makeConstraints { make in
                make.center.equalToSuperview()
                make.width.equalTo(200)
                make.height.equalTo(50)
            }
            
            signUpUserButton.snp.makeConstraints { make in
                make.bottom.equalTo(signUpVetButton.snp.top).offset(-20)
                make.centerX.equalToSuperview()
                make.width.equalTo(200)
            }
            
            signInButton.snp.makeConstraints { make in
                make.bottom.equalTo(signUpUserButton.snp.top).offset(-20)
                make.centerX.equalToSuperview()
                make.width.equalTo(200)
            }
            
            logoImage.snp.makeConstraints { make in
                make.bottom.equalTo(signInButton.snp.bottom).offset(-100)
                make.centerX.equalToSuperview()
                make.width.equalTo(150)
                make.height.equalTo(150)
            }
            

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
