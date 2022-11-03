//
//  FirstViewController.swift
//  Elene_Kapanadze_18
//
//  Created by Ellen_Kapii on 19.07.22.
//

import UIKit

class FirstViewController: UIViewController {
    
    
    @IBOutlet weak var backGroundImage: UIImageView!
    
    
    @IBOutlet weak var redCircle: UIView!
    @IBOutlet weak var blueCircle: UIView!
    @IBOutlet weak var purpleTriangle: UIView!
    @IBOutlet weak var blackTriangle: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigation bar
        self.navigationController?.navigationBar.tintColor = .black
        
        // Giving shapes to views
        redCircle.asCircle()
        blueCircle.asCircle()
//        purpleTriangle.asTriangle()
//        blackTriangle.asTriangle()
        
        
        // Add tap to the view
        addRedCircleTap()
        addBlueCircleTap()
        addRedCirclePan()
        
        // notification
        NotificationCenter.default.addObserver(self, selector: #selector(changeBackground), name: Notification.Name("ge.Kapii.Elene-Kapanadze-18.Notification.changeImage"), object: nil)
    }
    
    
    // For red circle
    func addRedCircleTap() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(circleTapped))
        redCircle.addGestureRecognizer(tapGesture)
    }
    
    func addRedCirclePan() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        redCircle.addGestureRecognizer(panGesture)
    }
    
    
    // For blue circle
    func addBlueCircleTap() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(circleTapped))
        blueCircle.addGestureRecognizer(tapGesture)
    }
    
    // objc functions
    @objc func circleTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController
        guard let vc = vc else { return }
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
        print("\(purpleTriangle.layer.position)")
    }
    
    @objc func handlePanGesture(gesture: UIPanGestureRecognizer) {
        if gesture.state == .changed {
            let translation = gesture.translation(in: self.view)
            redCircle.transform = CGAffineTransform(translationX: translation.x, y: translation.y)
        } else if gesture.state == .ended {
            //print("\(redCircle.layer.position), \(blueCircle.layer.position)")
        }
    }
    
    @objc func changeBackground() {
        backGroundImage.image = UIImage.init(named: "secondBackground")
    }
    
}







extension UIView {
    func asCircle() {
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.masksToBounds = true
    }
}

//extension UIView {
//    func asTriangle() {
//        let heightWidth = self.frame.size.width
//        let path = CGMutablePath()
//
//        path.move(to: CGPoint(x: 0, y: heightWidth))
//        path.addLine(to: CGPoint(x:heightWidth/2, y: heightWidth/2))
//        path.addLine(to: CGPoint(x:heightWidth, y:heightWidth))
//        path.addLine(to: CGPoint(x:0, y:heightWidth))
//
//        let shape = CAShapeLayer()
//        shape.path = path
//
//        self.layer.insertSublayer(shape, at: 1)
//    }
//}

