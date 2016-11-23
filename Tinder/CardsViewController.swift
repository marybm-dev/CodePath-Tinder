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

        let radians = 90.degreesToRadians
        
        if sender.state == .began {
            imageOriginalCener = profileImageView.center
            print("began")
            
        } else if sender.state == .changed {
            print(translation.x)
        

            if translation.x > 50 {
                UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseOut, animations: {
                    self.profileImageView.transform = CGAffineTransform.init(rotationAngle: CGFloat(radians))
                    self.profileImageView.center.x = 100
                })
            } else if translation.x < -50 {
                UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseOut, animations: {
                    self.profileImageView.transform = CGAffineTransform.init(rotationAngle: -CGFloat(radians))
                    self.profileImageView.center.x = -100
                })
            } else {
                self.profileImageView.transform = CGAffineTransform.identity
            }
        }
    }
}

