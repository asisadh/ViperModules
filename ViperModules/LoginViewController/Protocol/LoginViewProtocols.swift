//
//  LoginViewProtocols.swift
//  Login-VIPER
//
//  Created by Aashish Adhikari on 3/3/19.
//  Copyright © 2019 Aashish Adhikari. All rights reserved.
//

import Foundation
import UIKit

protocol LoginViewProtocol: class{
    var presenter: LoginViewPresenterProtocol? { get set }
    
    //Presenter -> View
    func showError(message: String)
    func showLoading()
    func hideLoading()
}

protocol LoginViewPresenterProtocol: class {
    var view: LoginViewProtocol? { get set }
    var interactor: LoginViewInteractorInputProtocol? {get set}
    var wireFrame: LoginViewWireFrameProtocol? {get set}
    
    //View -> Presenter
    func viewDidLoad()
    func forgetPassword()
    func signup()
    func signIn(username: String, password: String)
    func routeToHomeScreen()
    func showAlert(message: String)
}

protocol LoginViewInteractorInputProtocol: class{
    var presenter: LoginViewInteractorOutputProtocol? {get set}
    var remoteDataManager: LoginViewRemoteDataManagerInputProtocol? { get set }
    var localDataManager: LoginViewLocalDataManagerInputProtocol? { get set }
    
    //Presenter -> Intractor
    func postLoginRequest(username: String, password: String)
    
    static func isUserAlreadyLoggedIn() -> Bool
}

protocol LoginViewInteractorOutputProtocol: class{
    
    // Intractor -> Presenter
    func didLoginCompleted()
    func onError(message: String)
}

protocol LoginViewWireFrameProtocol: class{
    
    var delegate: LoginViewDelegateProtocol? { get set }
    
    static func createLoginViewModule(delegate: LoginViewDelegateProtocol?) -> UIViewController
    
    //Presenter -> WireFrame
    func presentHomeScreen(from view: LoginViewProtocol)
    func presentForgetPasswordScreen(from view: LoginViewProtocol)
    func presentSignUpScreen(from view: LoginViewProtocol)
    func presentAlertScreen(from view: LoginViewProtocol, message: String)
    func dismissLoginScreen(from view: LoginViewProtocol)
}

protocol LoginViewRemoteDataManagerInputProtocol: class{
    var remoteRequestHandler: LoginViewRemoteDataManagerOutputProtocol? { get set }
    
    // Intractor -> RemoteDataManager
    func postLoginRequest(loginModel: LoginRequestModel)
}

protocol LoginViewLocalDataManagerInputProtocol: class{
    
    static func reteriveUser() throws -> User?
    
    // INTERACTOR -> LOCALDATAMANAGER
    func saveUser(token: String, userData: UserData) throws
}

protocol LoginViewRemoteDataManagerOutputProtocol: class{
    
    //Remote Data Manager -> Intractor
    func onSucessfulLogin(token: String, user: UserData)
    func onError(message: String)
}

protocol LoginViewDelegateProtocol: class{
    func onLoginSuccess()
}

