//
//  DraggableImageView.swift
//  Tinder
//
//  Created by Mary Martinez on 11/15/16.
//  Copyright © 2016 Mary Martinez. All rights reserved.
//

import UIKit

class DraggableImageView: UIView {

    var imageOriginalCener: CGPoint!
    
    var view: UIView!
    
    var image: UIImage? {
        didSet {
            profileImageView.image = image
        }
    }
    
    @IBOutlet weak var profileImageView: UIImageView!

    @IBAction func onImagePan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self)
        
        if sender.state == .began {
            imageOriginalCener = profileImageView.center
            
        } else if sender.state == .changed {
            
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
                self.profileImageView.center.x = translation.x
            })
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    func initSubviews() {
        let nib = UINib(nibName: "DraggableImageView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        view.frame = bounds
        addSubview(view)
    }
}
