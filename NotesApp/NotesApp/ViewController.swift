//
//  ViewController.swift
//  NotesApp
//
//  Created by srk on 04/07/21.
//  Copyright © 2021 Nikunj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let email = "nikunjkoladiya22@gmail.com"
    let password = "2204"
    
    private let loginLabel:UILabel = {
        let label = UILabel()
        label.text = "Login Here.."
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textAlignment = .center
        return label
    }()
    
    private let emailLabel:UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private let emailTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Your Email"
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.textAlignment = .center
        textField.backgroundColor = #colorLiteral(red: 0.9637209141, green: 0.9637209141, blue: 0.9637209141, alpha: 1)
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    private let passwordLabel:UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private let passwordTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Your Password"
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.textAlignment = .center
        textField.isSecureTextEntry = true
        textField.backgroundColor = #colorLiteral(red: 0.9637209141, green: 0.9637209141, blue: 0.9637209141, alpha: 1)
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    private let loginButton:UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(moveTo), for: .touchUpInside)
        button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        button.layer.cornerRadius = 20
        return button
    }()
    
    @objc func moveTo(){
        if email == emailTextField.text! && password == passwordTextField.text! {
            UserDefaults.standard.set(emailTextField.text!, forKey: "email")
            let vc = storyboard?.instantiateViewController(withIdentifier: "HomeVC")
            navigationController?.pushViewController(vc!, animated: true)
        } else {
            let alert = UIAlertController(title: "Alert!", message: "Email and Password didn't match", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loginLabel)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        loginLabel.frame = CGRect(x: 20, y: 120, width: view.width - 40, height: 60)
        emailLabel.frame = CGRect(x: 20, y: loginLabel.bottom + 40, width: view.width - 40, height: 20)
        emailTextField.frame = CGRect(x: 20, y: emailLabel.bottom + 10, width: view.width - 40, height: 60)
        passwordLabel.frame = CGRect(x: 20, y: emailTextField.bottom + 20, width: view.width - 40, height: 20)
        passwordTextField.frame = CGRect(x: 20, y: passwordLabel.bottom + 10, width: view.width - 40, height: 60)
        loginButton.frame = CGRect(x: 20, y: passwordTextField.bottom + 20, width: view.width - 40, height: 60)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }

}

