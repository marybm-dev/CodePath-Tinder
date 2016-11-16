//
//  ViewController.swift
//  Tinder
//
//  Created by Mary Martinez on 11/15/16.
//  Copyright © 2016 Mary Martinez. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var profileImageView: DraggableImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImageView.image = UIImage(named: "ryan")
    }

}

