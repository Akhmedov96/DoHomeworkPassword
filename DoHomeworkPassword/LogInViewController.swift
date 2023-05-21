//
//  LogInViewController.swift
//  DoHomeworkPassword
//
//  Created by Нахид  Ахмедов on 14/05/2023.
//

import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    
    var welcome: String!
    
    private let primaryColor = UIColor(
      red: 210/255,
    green: 109/255,
    blue: 128/255,
    alpha: 1
    )
    
    private let secondaryColor = UIColor(
      red: 107/255,
    green: 148/255,
    blue: 230/255,
    alpha: 1
    )

    override func viewDidLoad() {
        welcome = welcomeLabel.text
        view.gradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
    }
    
    @IBAction func logOnButtonTaped() {
        UserDefaults.standard.set(false, forKey: "ISUSERLOGGEDIN")
        self.navigationController?.popViewController(animated: true)
        dismiss(animated: true)
    }
}
extension UIView {
    func gradientLayer(topColor: UIColor, bottomColor: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradientLayer, at: 0)
        
    }
}
