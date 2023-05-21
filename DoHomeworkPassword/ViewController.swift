//
//  ViewController.swift
//  DoHomeworkPassword
//
//  Created by Нахид  Ахмедов on 14/05/2023.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.bool(forKey: "ISUSERLOGGEDIN") == true {
            let LoginVC =
            self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginViewController
            self.navigationController?.pushViewController(LoginVC, animated: false)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let loginVC = segue.destination as? LoginViewController else { return }
        loginVC.welcome = userNameTF.text
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    @IBAction func logInButtonTapped(_ sender: Any?) {
        if userNameTF.text == "Nahid" && passwordTF.text == "Ahmedov" {
            UserDefaults.standard.set(true, forKey: "ISUSERLOGGEDIN")
            let LoginVC =
            self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginViewController
            self.navigationController?.pushViewController(LoginVC, animated: true)
        }
        
        guard let inputText = userNameTF.text, !inputText.isEmpty else {
            showAlert(withTitle: "Text field is Empty", andMessage: "Write your User Name or Password")
            return
        }
        
        if userNameTF.text != "Nahid" || passwordTF.text != "Ahmedov" {
            showAlert(withTitle: "Attention!", andMessage: "Login or Password is not correct")
            return
        }
        performSegue(withIdentifier: "showName", sender: "Nahid")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = "" 
    }
    
    @IBAction func forgotNameButtonTapped(_ sender: Any) {
            showAlert(withTitle: "Forgot your User Name?", andMessage: "Your name is Nahid")
            return
    }
    
    
    @IBAction func forgotPasswordButtonTapped() {
            showAlert(withTitle: "Forgot your Password?", andMessage: "Your password is Ahmedov")
            return
    }
    
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTF.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

