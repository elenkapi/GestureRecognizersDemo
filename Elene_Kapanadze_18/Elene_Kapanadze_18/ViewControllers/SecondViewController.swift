//
//  SecondViewController.swift
//  Elene_Kapanadze_18
//
//  Created by Ellen_Kapii on 19.07.22.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var targetImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        targetImage.isUserInteractionEnabled = true
        
        // add gesturerecognizers
        imageAddTap()
        addSwipe()
        addPintch()
    }
    
    // add gestures functions
    func imageAddTap() {
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPress))
        longPressGesture.minimumPressDuration = 2
        targetImage.addGestureRecognizer(longPressGesture)
    }
    
    func addSwipe() {
        let rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipedOnImage))
        rightSwipeGesture.direction = .right
        
        targetImage.addGestureRecognizer(rightSwipeGesture)
        
        let leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipedOnImage))
        leftSwipeGesture.direction = .left
        
        targetImage.addGestureRecognizer(leftSwipeGesture)
        
        let upSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipedOnImage))
        upSwipeGesture.direction = .up
        
        targetImage.addGestureRecognizer(upSwipeGesture)
        
        let downSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipedOnImage))
        downSwipeGesture.direction = .down
        
        targetImage.addGestureRecognizer(downSwipeGesture)
    }
    
    
    func addPintch() {
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pintched))
        targetImage.addGestureRecognizer(pinchGesture)
    }
    
    
    
    
    
    // objc functions
    
    
    @objc func longPress(duration: UILongPressGestureRecognizer) {
        if duration.minimumPressDuration < 1 {
            self.navigationController?.popViewController(animated: true)
        } else {
            UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveLinear, animations: {
                self.targetImage.alpha = 0 }, completion: nil)
        }
        
    }
    
    
    
    @objc func swipedOnImage(gesture: UISwipeGestureRecognizer) {
        switch gesture.direction {
        case .right:
            targetImage.layer.position.x += 50
        case .left:
            targetImage.layer.position.x -= 50
        case .up:
            targetImage.layer.position.y += 50
        case .down:
            targetImage.layer.position.y -= 50
        default:
            print("not gon happ")
        }
    }
    
    @objc func pintched(gesture: UIPinchGestureRecognizer) {
        gesture.view?.transform = (gesture.view?.transform.scaledBy(x: gesture.scale, y: gesture.scale))!
        
        let guide = view.safeAreaLayoutGuide
        let width = guide.layoutFrame.size.width
        
        
        gesture.scale = 1
        
        if targetImage.frame.width > width {
            targetImage.transform = CGAffineTransform.identity
        }
        
        
        // changing firstVC background image
        NotificationCenter.default.post(name: Notification.Name("ge.Kapii.Elene-Kapanadze-18.Notification.changeImage"), object: nil)
    }
    
    
    
}
