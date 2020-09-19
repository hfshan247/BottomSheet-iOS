//
//  ViewController.swift
//  Tutorial
//
//  Created by HF's Macbook on 9/18/20.
//  Copyright © 2020 CodeJunkie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var bottomSheet: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bottomSheet.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        bottomSheet.layer.masksToBounds = true
        
        bottomSheet.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(didPanOnMapWrapper)))
    }
    
    @objc func didPanOnMapWrapper(_ sender: UIPanGestureRecognizer) {

           let translation = sender.translation(in: self.bottomSheet)
           bottomSheet.center = CGPoint(x: bottomSheet.center.x, y: bottomSheet.center.y + translation.y)
           sender.setTranslation(CGPoint.zero, in: self.view)
           
        if bottomSheet.frame.minY < 180 {
            self.bottomSheet.frame = CGRect(x: 0, y: 180, width: self.bottomSheet.frame.width, height: self.bottomSheet.frame.height)
            
        }
        else if bottomSheet.frame.minY > (self.view.frame.height + -200) {
            self.bottomSheet.frame = CGRect(x: 0, y: self.view.frame.height + -200 , width: self.bottomSheet.frame.width, height: self.bottomSheet.frame.height)
            
        }

           if sender.state == .ended{
               let velocity = sender.velocity(in: bottomSheet)

               if velocity.y < 0{

                   UIView.animate(withDuration: 0.5) {
                       self.bottomSheet.frame = CGRect(x: 0, y: 200.0 , width: self.bottomSheet.frame.width, height: self.bottomSheet.frame.height)
                   }
               }
               else{
                   UIView.animate(withDuration: 0.5) {
                    self.bottomSheet.frame = CGRect(x: 0, y: self.view.frame.height + -220 , width: self.bottomSheet.frame.width, height: self.bottomSheet.frame.height)
                       
                   }
               }
           }
       }
    
}

