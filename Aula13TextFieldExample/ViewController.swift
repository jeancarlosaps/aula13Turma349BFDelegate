//
//  ViewController.swift
//  Aula13TextFieldExample
//
//  Created by Jean Carlos on 24/01/23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - PROPERTIES
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureTextField()
    }
    
    // MARK: - METHODS
    func configureView() {
        view.backgroundColor = .lightGray
        loginButton.setTitle("Login", for: .normal)
        loginButton.isEnabled = false
    }
    
    func configureTextField() {
        // Assinando o delegate/protocol
        userTextField.delegate = self
        emailTextField.delegate = self
        
        userTextField.placeholder = "Nome de usuário"
        emailTextField.placeholder = "e-mail"
//        userTextField.layer.borderColor = UIColor.red.cgColor
//        emailTextField.layer.borderColor = UIColor.green.cgColor
//        userTextField.layer.borderWidth = 2
//        emailTextField.layer.borderWidth = 2
//        userTextField.layer.cornerRadius = 8
//        userTextField.layer.masksToBounds = true
    }
    
    @IBAction func didTapLoginButton(_ sender: Any) {
        print("Login")
    }
    
    private func validateButton() {
        if userTextField.text == "" || emailTextField.text == "" {
            loginButton.isEnabled = false
        } else {
            loginButton.isEnabled = true
        }
    }
}

// MARK: - EXTENSIONS
// Conformando com o delegate/protocol
extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
        
        // Valindando cor da borda.
        if textField.text == ""{
            textField.layer.borderWidth = 5
        } else {
            textField.layer.borderWidth = 8
            textField.layer.borderColor = UIColor.red.cgColor
        }
        validateButton()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        textField.resignFirstResponder()
        return true
    }
}
