//
//
// ExtensionColor.swift
// MarvelApp
//
// Using Swift 5.0
//
// Created by Ing. Miguel de Jesús Robledo Vera on 06/10/21.
// Copyright (c) 2021 and Confidential to ROBLEDO All rights reserved.
//


import UIKit

extension UIColor {
    static var marvelPrimary = UIColor(named: "Primary")!
}


extension UIFont {
    
    func marvelTitle() -> UIFont {
        return UIFont(name: "Marvel-Regular", size: 22)!
    }
    
}
