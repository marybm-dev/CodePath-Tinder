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

    var imageOriginalCener: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImageView.image = UIImage(named: "ryan")
    }

    @IBAction func didPan(_ sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: profileImageView)
        let velocity = sender.velocity(in: self.view)
        
        var toValue: Double = 0.0
        
        if sender.state == .began {
            imageOriginalCener = profileImageView.center
            print("began")
            
        } else if sender.state == .changed {
            print("changed")
            
            if velocity.x > 0 { // rotate clockwise
                toValue = -(M_PI)
                
            } else { // rotate counter clockwise
                toValue = M_PI
            }
            
            let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
            rotationAnimation.fromValue = 0.0
            rotationAnimation.toValue = toValue
            rotationAnimation.duration = 3.0
            
            self.profileImageView.layer.add(rotationAnimation, forKey: nil)
            
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
                self.profileImageView.center.x = translation.x
            })
        }
    }
}

