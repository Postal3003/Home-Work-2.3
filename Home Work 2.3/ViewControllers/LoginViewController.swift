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
        guard let tabBarController = segue.destination as? UITabBarController else {return}
        guard let viewControllers = tabBarController.viewControllers else {return}
        
        viewControllers.forEach {
            if let welcomeVC = $0 as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = $0 as?
                        UINavigationController {
                let userInfoVC = navigationVC.topViewController as! UserInfoViewController
                userInfoVC.user = user
                
            }
        }
    }

    
    // MARK: - IBActions
    
    @IBAction func logInPressed() {
        if userNameTextField.text != user.login || passwordTextField.text != user.password {
           showAlert(title: "Ошибка!!!",
                     message: "А вы точно знаете логин и пароль?",
                     textField: passwordTextField
           )
            return
        }

        performSegue(withIdentifier: "showWelcomeVC", sender: nil)
        
        
        }
    
    @IBAction func forgotRegisterData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Oops!", message: "Зовут тебя \(user.login) 👑")
        : showAlert(title: "Oops!", message: "Твой пароль \(user.password)")

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

// MARK: - Alert Controller
extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            logInPressed()
            performSegue(withIdentifier: "showWelcomeVC", sender: nil)
        }
        return true
    }
}



    
    

    
    

    
    
    
