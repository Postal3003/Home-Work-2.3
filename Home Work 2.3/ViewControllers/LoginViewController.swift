//
//  LoginViewController.swift
//  Home Work 2.3
//
//  Created by Дмитрий Бородулькин on 09.01.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    
    // MARK: - IB Outlets
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    // MARK: - Private properties
    private let user = User.getUserData()
    
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeVC = segue.destination as! WelcomeViewController
        welcomeVC.user = user
    }

    
    // MARK: - IBActions
    
    @IBAction func logInPressed() {
        if userNameTextField.text != user || passwordTextField.text != password {
           showAlert(title: "Ошибка!!!", message: "А вы точно знаете логин и пароль?", textField: passwordTextField)
            }


        }
    
    @IBAction func forgotRegisterData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Oops!", message: "Зовут тебя \(user) 👑")
        : showAlert(title: "Oops!", message: "Твой пароль \(password)")

    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
}

// MARK: - Private Metods
extension LoginViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}




    
    

    
    

    
    
    
