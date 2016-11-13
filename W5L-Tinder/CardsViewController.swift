//
//  CardsViewController.swift
//  W5L-Tinder
//
//  Created by Jeff Rauch on 11/13/16.
//  Copyright © 2016 Jeff Rauch. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    
    var cardViewOriginalCenter: CGPoint!

    @IBOutlet weak var cardView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var destinationViewController = segue.destination as! ProfileViewController
        
        destinationViewController.image = self.cardView.image
    }
    
    @IBAction func didPanCard(_ sender: UIPanGestureRecognizer) {
        
        let location = sender.location(in: view)
        let velocity = sender.velocity(in: view)
        let translation = sender.translation(in: view)
        
        
        
        
        print("velocity", velocity)
        
        if sender.state == .began {
            
            cardViewOriginalCenter = cardView.center
            

            
        } else if sender.state == .changed {
            
            cardView.center = CGPoint(x: cardViewOriginalCenter.x + translation.x, y: cardViewOriginalCenter.y)
            
            if translation.x > 0 {
        
                cardView.transform = cardView.transform.rotated(by: CGFloat(0.5 * M_PI / 180))
                
            } else {
                
                cardView.transform = cardView.transform.rotated(by: CGFloat(-0.5 * M_PI / 180))
        
            }
            

           
        
        } else if sender.state == .ended {
            
            if translation.x > 100 {
                
                UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: { () -> Void in
                    self.cardView.transform = CGAffineTransform(translationX: 500, y: 0)
                }, completion: nil)
                
                
            } else if translation.x < -100 {
                
                UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: { () -> Void in
                    self.cardView.transform = CGAffineTransform(translationX: -500, y: 0)
                }, completion: nil)
                
            } else {
                
                UIView.animate(withDuration: 0.1, delay: 0, options: [], animations: { () -> Void in
                    self.cardView.center = self.cardViewOriginalCenter
                    self.cardView.transform = CGAffineTransform.identity
                }, completion: nil)
                
            }
            
        }
        
        print("\(translation)")
        
    }



}
