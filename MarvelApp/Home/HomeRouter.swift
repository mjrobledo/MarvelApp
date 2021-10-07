//
//
// HomeRouter.swift
// MarvelApp
//
// Using Swift 5.0
//
// Created by Ing. Miguel de Jesús Robledo Vera on 28/09/21.
// Copyright (c) 2021 and Confidential to ___ORGANIZATIONNAME___ All rights reserved.
//


import UIKit

class HomeRouter {
    
    
    private var sourceView = UIViewController()
    
    var viewController : UIViewController {
        return createViewController()
    }
    
    private func createViewController() -> UIViewController {
        let bundle = Bundle(for: HomeView.self)
        let view = HomeView(nibName: "HomeView", bundle: bundle)
        
        return view
    }
    
    func setSourceView( _ sourceView: UIViewController?) {
        guard let view = sourceView else {
            fatalError("Error unkonw")
        }
        self.sourceView = view
    }
    
    func openDetailView(item: Results) {
        let vc = DetailRouter().viewController as! DetailView
        vc.modalPopPup()
        vc.result = item
        self.sourceView.present(vc, animated: true, completion: nil)
    }
}
