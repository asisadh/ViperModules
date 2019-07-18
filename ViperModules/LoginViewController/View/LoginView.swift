//
//  LoginView.swift
//  Login-VIPER
//
//  Created by Aashish Adhikari on 3/3/19.
//  Copyright © 2019 Aashish Adhikari. All rights reserved.
//

import UIKit

class LoginView: UIViewController{
    
    var presenter: LoginViewPresenterProtocol?
    
    //MARK:- UI ELEMENTS
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var txtUsernameValue: UITextField! { didSet{ txtUsernameValue.delegate = self }}
    @IBOutlet weak var txtPasswordValue: UITextField! { didSet{ txtPasswordValue.delegate = self }}
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var lblForgetPassword: UILabel!
    @IBOutlet weak var lblDontHaveAnAccount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setUpLblProperties()
        setUpTapGestures()
        addDoneButtonOnKeyboard(parentView: self.view, textField: txtUsernameValue)
        addDoneButtonOnKeyboard(parentView: self.view, textField: txtPasswordValue)
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        processLogin()
    }
    
    func processLogin(){
        if let username = txtUsernameValue.text,
            let password = txtPasswordValue.text{
            presenter?.signIn(username: username, password: password)
        }else{
            showError(message: "Username and password cannot be empty.")
        }
    }
}
