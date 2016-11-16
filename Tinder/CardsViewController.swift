//
//  ViewController.swift
//  Tinder
//
//  Created by Mary Martinez on 11/15/16.
//  Copyright © 2016 Mary Martinez. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var personImageView: UIImageView!
    
    var imageOriginalCener: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onImagePanGesture(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        
        if sender.state == .began {
            imageOriginalCener = personImageView.center
            
        } else if sender.state == .changed {
            
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
                self.personImageView.center.x = translation.x
            })
            
        }
        
    }
}

