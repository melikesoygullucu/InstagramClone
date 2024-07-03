//
//  ViewController.swift
//  InstagramClone
//
//  Created by Melike Soygüllücü on 1.07.2024.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func signInButton(_ sender: Any) {
        performSegue(withIdentifier: "toFeedVC", sender: nil)
    }
    
    @IBAction func SignUpButton(_ sender: Any) {
        
        if emailTextField.text != ""  && passwordTextField.text != ""{
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { authResult, error in
                if error != nil {
                    self.alertDialog(title: "Error", message: error?.localizedDescription ?? "An error occurred. Please try again later.")
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        } else {
            self.alertDialog(title: "Error!", message: "Please enter your username and password.")
        }
    }
    
    func alertDialog(title : String , message : String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
}

