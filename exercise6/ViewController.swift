//
//  ViewController.swift
//  exercise6
//
//  Created by Scores_Main_User on 1/10/21.
//

import UIKit

class ViewController: UIViewController
{

    let layer: CALayer = CALayer()


    override func viewDidLoad()
    {

        super.viewDidLoad()


        layer.backgroundColor = UIColor.systemRed.cgColor
        layer.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        view.layer.addSublayer(layer)

        DispatchQueue.main.asyncAfter(deadline: .now() + 2)
        {
            
//            self.animateMovement()
//            self.animateOpacity()
//            self.animateColor()
//            self.animateRotation()
//            self.animateScale()
            self.complexAnimation()
            Timer.scheduledTimer(withTimeInterval: 8.0, repeats: false) { timer in
                self.layer.removeAllAnimations()

            }
        }

    }


    func animateMovement()
    {
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = CGPoint(x: self.layer.frame.origin.x + (layer.frame.size.width / 2),
                y: self.layer.frame.origin.y + (layer.frame.size.height / 2))
        animation.toValue = CGPoint(x: 200, y: 200) // 200 instaed of 100 so we can see it better
        animation.duration = 2
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = 0
        self.layer.add(animation, forKey: nil)
    }


    func animateOpacity(value: Double = 0.0, delay: Double = 0, infinity: Bool = false)
    {
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 1
        animation.toValue = value
        animation.duration = 2
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime() + delay
        if infinity
        {
            animation.repeatCount = .infinity

        }

        self.layer.add(animation, forKey: nil)
    }


    func animateColor()
    {
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "backgroundColor")
        animation.fromValue = UIColor.systemRed.cgColor
        animation.toValue = UIColor.systemGreen.cgColor
        animation.duration = 2
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        self.layer.add(animation, forKey: nil)
    }


    func animateRotation()
    {
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.toValue = Double.pi / 2
        animation.duration = 2
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()

        self.layer.add(animation, forKey: nil)
    }


    func animateScale(scale: Int = 3)
    {
                
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "transform.scale")
        animation.fromValue = 1
        animation.toValue = scale
        animation.duration = 2
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        self.layer.add(animation, forKey: nil)
        
        
        
        
    }


    func animateSecondRotation()
    {
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.toValue = Double.pi / 4
        animation.duration = 2
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime() + 4
        self.layer.add(animation, forKey: nil)
    }


    func complexAnimation()
    {
        self.animateMovement() // i know you didnt ask it, but the location of (x:0,y:0) place the view above the safe area which is not ideal place to see the animations.
        self.animateScale(scale: 2)
        self.animateColor()
        self.animateOpacity(value: 0.5, delay: 6, infinity: false)
    }
}

