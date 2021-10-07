//
//
// ExtensionView.swift
// MarvelApp
//
// Using Swift 5.0
//
// Created by Ing. Miguel de Jesús Robledo Vera on 06/10/21.
// Copyright (c) 2021 and Confidential to ROBLEDO All rights reserved.
//


import UIKit

extension UIViewController {
    func modalPopPup() {
        self.providesPresentationContextTransitionStyle = true
        self.definesPresentationContext = true
        self.modalPresentationStyle = .overCurrentContext
        self.modalTransitionStyle = .crossDissolve
    }
}

extension UIView {
    
    
    /// Function in charge of applying rounded corners and shadow to a view
    /// - Parameters:
    ///   - color: Shade color
    ///   - opacity: Shadow opacity
    ///   - radius: Rounding radius
    ///   - edge: Shadow location
    ///   - shadowSpace: Int value
    ///   - cornerRadius: corner radius Int
    func applyShadowWithCornerRadius(color:UIColor? = .gray, opacity:Float? = 1, radius: CGFloat? = 5, edge:AIEdge? = .Bottom_Right, shadowSpace:CGFloat? = 5, cornerRadius: CGFloat? = 4)    {

        var sizeOffset:CGSize = CGSize.zero
        switch edge {
        case .Top:
            sizeOffset = CGSize(width: 0, height: -shadowSpace!)
        case .Left:
            sizeOffset = CGSize(width: -shadowSpace!, height: 0)
        case .Bottom:
            sizeOffset = CGSize(width: 0, height: shadowSpace!)
        case .Right:
            sizeOffset = CGSize(width: shadowSpace!, height: 0)


        case .Top_Left:
            sizeOffset = CGSize(width: -shadowSpace!, height: -shadowSpace!)
        case .Top_Right:
            sizeOffset = CGSize(width: shadowSpace!, height: -shadowSpace!)
        case .Bottom_Left:
            sizeOffset = CGSize(width: -shadowSpace!, height: shadowSpace!)
        case .Bottom_Right:
            sizeOffset = CGSize(width: shadowSpace!, height: shadowSpace!)
        case .All:
            sizeOffset = CGSize(width: 0, height: 0)
        
         
        case .none:
            sizeOffset = CGSize.zero
        case .some(.None):
            sizeOffset = CGSize.zero
        }

        self.layer.cornerRadius = self.frame.size.height / cornerRadius!
        self.layer.masksToBounds = true;

        self.layer.shadowColor = color?.cgColor
        self.layer.shadowOpacity = opacity!
        self.layer.shadowOffset = sizeOffset
        self.layer.shadowRadius = radius!
        self.layer.masksToBounds = false

    }
    
    
    func round() {
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.masksToBounds = true
    }
    
    
    func round(radius: Int) {
        self.layer.cornerRadius = CGFloat(radius)
        self.layer.masksToBounds = true
    }
    

}

enum AIEdge:Int {
    case
    Top,
    Left,
    Bottom,
    Right,
    Top_Left,
    Top_Right,
    Bottom_Left,
    Bottom_Right,
    All,
    None
}
