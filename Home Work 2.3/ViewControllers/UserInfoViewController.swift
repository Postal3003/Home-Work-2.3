//
//  UserInfoViewController.swift
//  Home Work 2.3
//
//  Created by Дмитрий Бородулькин on 24.05.2022.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    var user: User!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = user.person.fullName
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let imageVC = segue.destination as? ImageViewController
        else {return}
        imageVC.user = user
    }



}
