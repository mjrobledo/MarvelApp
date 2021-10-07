//
//
// DetailRouter.swift
// MarvelApp
//
// Using Swift 5.0
//
// Created by Ing. Miguel de Jesús Robledo Vera on 06/10/21.
// Copyright (c) 2021 and Confidential to ROBLEDO All rights reserved.
//


import UIKit

class DetailRouter {
    
    
    private var sourceView = UIViewController()
    
    var viewController : UIViewController {
        return createViewController()
    }
    
    private func createViewController() -> UIViewController {
        let bundle = Bundle(for: HomeView.self)
        let view = DetailView(nibName: "DetailView", bundle: bundle)
        
        return view
    }
    
    func setSourceView( _ sourceView: UIViewController?) {
        guard let view = sourceView else {
            fatalError("Error unkonw")
        }
        self.sourceView = view
    }
    
    func openLink(link: URL) {
        UIApplication.shared.open(link)
    }
}
