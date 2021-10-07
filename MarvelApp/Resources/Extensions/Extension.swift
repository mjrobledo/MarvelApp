//
//
// Extension.swift
// MarvelApp
//
// Using Swift 5.0
//
// Created by Ing. Miguel de Jesús Robledo Vera on 28/09/21.
// Copyright (c) 2021 and Confidential to ROBLEDO All rights reserved.
//


import UIKit
import MBProgressHUD

extension UIViewController {
    
    
    //MARK:- MBProgressHUD
    func showIndicator(withTitle title: String? = "", and Description:String? = "") {
        DispatchQueue.main.async {
            let Indicator = MBProgressHUD.showAdded(to: self.view, animated: true)
            Indicator.label.text = title
            Indicator.isUserInteractionEnabled = false
            Indicator.detailsLabel.text = Description
            Indicator.show(animated: true)
        }
    }
    
    
    /// Hide the Loader
    func hideIndicator() {
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
    
    //MARK:- Functions alert
    func simpleAlert(title: String, message: String, titleButton: String? = "Ok") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: titleButton, style: UIAlertAction.Style.default, handler: nil))
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}
