//
//  SignUpView+UILable+UIButton.swift
//  Login-VIPER
//
//  Created by Aashish Adhikari on 3/3/19.
//  Copyright © 2019 Aashish Adhikari. All rights reserved.
//
import UIKit

extension SignUpView{
    
    func setUpLblProperties(){
        // Setting Up Login Label
        lblSignUpTitle.lineBreakMode = .byWordWrapping
        lblSignUpTitle.numberOfLines = 0
        lblSignUpTitle.textColor = UIColor(red:0.78, green:0.61, blue:0.43, alpha:1)
        let signUpTextContent = "Sign Up"
        let signUpTextString = NSMutableAttributedString(string: signUpTextContent, attributes: [
            NSAttributedString.Key.font: UIFont(name: "Roboto-Regular", size: 18)!
            ])
        let loginTextRange = NSRange(location: 0, length: signUpTextString.length)
        let loginParagraphStyle = NSMutableParagraphStyle()
        loginParagraphStyle.lineSpacing = 1.17
        loginParagraphStyle.alignment = .center
        signUpTextString.addAttribute(NSAttributedString.Key.paragraphStyle, value:loginParagraphStyle, range: loginTextRange)
        lblSignUpTitle.attributedText = signUpTextString
        lblSignUpTitle.sizeToFit()
        
        //setting up
        lblAlreadyHaveAccount.lineBreakMode = .byWordWrapping
        lblAlreadyHaveAccount.numberOfLines = 0
        let dontHaveAccountText = "Aleady have an account? Login"
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: dontHaveAccountText)
        attributedString.setColorForText(textForAttribute: "Aleady have an account?", withColor: UIColor(red:0.38, green:0.37, blue:0.36, alpha:1))
        #warning(" Replace Regular with light on production ")
        attributedString.setFontForText(textForAttribute: "Aleady have an account?", withFont: UIFont(name: "Roboto-Regular", size: 15)!)
        attributedString.setColorForText(textForAttribute: "Login", withColor: UIColor(red:0.78, green:0.61, blue:0.43, alpha:1))
        #warning(" Replace Regular with bold on production ")
        attributedString.setFontForText(textForAttribute: "Login", withFont: UIFont(name: "Roboto-Regular", size: 15)!)
        lblAlreadyHaveAccount.attributedText = attributedString
        lblAlreadyHaveAccount.sizeToFit()
        
        //login button
        //        let layer = UIView(frame: CGRect(x: 66, y: 312, width: 229, height: 30))
        btnSignUp.layer.cornerRadius = 15
        btnSignUp.layer.shadowOffset = CGSize(width: 0, height: 2)
        btnSignUp.layer.shadowColor = UIColor(red:0, green:0, blue:0, alpha:0.5).cgColor
        btnSignUp.layer.shadowOpacity = 1
        btnSignUp.layer.shadowRadius = 4
        
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x: 0, y: 0, width: 229, height: 30)
        gradient.colors = [
            UIColor(red:0.65, green:0.25, blue:0.03, alpha:1).cgColor,
            UIColor(red:0.82, green:0.51, blue:0.22, alpha:1).cgColor
        ]
        gradient.locations = [0, 1]
        gradient.startPoint = CGPoint.zero
        gradient.endPoint = CGPoint(x: 1.02, y: 1.01)
        gradient.cornerRadius = 15
        btnSignUp.layer.addSublayer(gradient)
    }
}
