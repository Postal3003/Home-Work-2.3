//
//  ImageViewController.swift
//  Home Work 2.3
//
//  Created by Дмитрий Бородулькин on 24.05.2022.
//

import UIKit

class ImageViewController: UIViewController {

    
    
    @IBOutlet var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = imageView.frame.height / 11
        }
    }
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: user.person.image)


    }
}
