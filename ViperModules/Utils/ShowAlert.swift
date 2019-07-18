//
//  ShowAlert.swift
//  Login-VIPER
//
//  Created by Aashish Adhikari on 3/28/19.
//  Copyright © 2019 Aashish Adhikari. All rights reserved.
//

import UIKit

func showAlertWithMessage(view: UIViewController , message: String){
    let alertView: UIAlertController = UIAlertController(title: nil, message: message, preferredStyle: UIAlertController.Style.alert)
    let alertAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
    alertView.addAction(alertAction)
    view.present(alertView, animated: true, completion: nil)
}

func showAlertWithMessageAndDismiss(currentView view: UIViewController , message: String){
    let alertView: UIAlertController = UIAlertController(title: nil, message: message, preferredStyle: UIAlertController.Style.alert)
    let alertAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel){ _ in
        view.navigationController?.popViewController(animated: true)
    }
    alertView.addAction(alertAction)
    view.present(alertView, animated: true, completion: nil)
}
