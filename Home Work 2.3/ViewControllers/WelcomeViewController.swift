//
//  WelcomeViewController.swift
//  Home Work 2.3
//
//  Created by Дмитрий Бородулькин on 09.01.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welkomeLabel: UILabel!

    var user: User!

    override func viewDidLoad() {
        welkomeLabel.text = "Welcome, \(user.person.fullName)!"
    }
}


