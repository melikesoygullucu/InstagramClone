//
//  SettingsViewController.swift
//  InstagramClone
//
//  Created by Melike Soygüllücü on 2.07.2024.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        performSegue(withIdentifier: "toViewController", sender: nil)
    }

}
