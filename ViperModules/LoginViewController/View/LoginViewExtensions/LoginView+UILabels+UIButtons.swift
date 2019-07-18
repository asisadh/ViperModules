//
//  LoginView+UILabels+UIButtons.swift
//  Login-VIPER
//
//  Created by Aashish Adhikari on 3/3/19.
//  Copyright © 2019 Aashish Adhikari. All rights reserved.
//

import UIKit

//MARK: Setting up UILabels and UIButtons Looks
extension LoginView{
    func setUpLblProperties(){
        // Setting Up Login Label
        loginLabel.lineBreakMode = .byWordWrapping
        loginLabel.numberOfLines = 0
        loginLabel.textColor = UIColor(red:0.78, green:0.61, blue:0.43, alpha:1)
        let loginTextContent = "Log In"
        let loginTextString = NSMutableAttributedString(string: loginTextContent, attributes: [
            NSAttributedString.Key.font: UIFont(name: "Roboto-Regular", size: 18)!
            ])
        let loginTextRange = NSRange(location: 0, length: loginTextString.length)
        let loginParagraphStyle = NSMutableParagraphStyle()
        loginParagraphStyle.lineSpacing = 1.17
        loginParagraphStyle.alignment = .center
        loginTextString.addAttribute(NSAttributedString.Key.paragraphStyle, value:loginParagraphStyle, range: loginTextRange)
        loginLabel.attributedText = loginTextString
        loginLabel.sizeToFit()
        
        // setting up ForgetPassword
        lblForgetPassword.lineBreakMode = .byWordWrapping
        lblForgetPassword.numberOfLines = 0
        lblForgetPassword.textColor = UIColor(red:0.11, green:0.11, blue:0.11, alpha:1)
        let forgetPasswordTextContent = "Forget password?"
        let forgetPasswordTextString = NSMutableAttributedString(string: forgetPasswordTextContent, attributes: [
            NSAttributedString.Key.font: UIFont(name: "Roboto-Regular", size: 12)!
            ])
        let forgetPasswordParagraphStyle = NSMutableParagraphStyle()
        forgetPasswordParagraphStyle.alignment = .left
        let forgetPasswordtextRange = NSRange(location: 0, length: forgetPasswordTextString.length)
        forgetPasswordTextString.addAttribute(NSAttributedString.Key.paragraphStyle, value:forgetPasswordParagraphStyle, range: forgetPasswordtextRange)
        lblForgetPassword.attributedText = forgetPasswordTextString
        lblForgetPassword.sizeToFit()
        
        //setting up
        lblDontHaveAnAccount.lineBreakMode = .byWordWrapping
        lblDontHaveAnAccount.numberOfLines = 0
        let dontHaveAccountText = "Don’t have an account? Sign up"
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: dontHaveAccountText)
        attributedString.setColorForText(textForAttribute: "Don’t have an account?", withColor: UIColor(red:0.38, green:0.37, blue:0.36, alpha:1))
        #warning(" Replace Regular with light on production ")
        attributedString.setFontForText(textForAttribute: "Don’t have an account?", withFont: UIFont(name: "Roboto-Regular", size: 15)!)
        attributedString.setColorForText(textForAttribute: "Sign up", withColor: UIColor(red:0.78, green:0.61, blue:0.43, alpha:1))
        #warning(" Replace Regular with bold on production ")
        attributedString.setFontForText(textForAttribute: "Sign up", withFont: UIFont(name: "Roboto-Regular", size: 15)!)
        lblDontHaveAnAccount.attributedText = attributedString
        lblDontHaveAnAccount.sizeToFit()
        
        //login button
        //        let layer = UIView(frame: CGRect(x: 66, y: 312, width: 229, height: 30))
        btnLogin.layer.cornerRadius = 15
        btnLogin.layer.shadowOffset = CGSize(width: 0, height: 2)
        btnLogin.layer.shadowColor = UIColor(red:0, green:0, blue:0, alpha:0.5).cgColor
        btnLogin.layer.shadowOpacity = 1
        btnLogin.layer.shadowRadius = 4
        
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
        btnLogin.layer.addSublayer(gradient)
    }
}
