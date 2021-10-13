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

class HomeRouter: HomeRouterProtocol {
      
    var viewController : UIViewController {
        return createViewController()
    }
    
    private func createViewController() -> UIViewController {
        let bundle = Bundle(for: HomeView.self)
        let view = HomeView(nibName: "HomeView", bundle: bundle)
        
        let viewModel: HomePresenterProtocol = HomeViewModel()
        let router: HomeRouterProtocol = HomeRouter()
        
        view.viewModel = viewModel
        viewModel.view = view
        viewModel.router = router
        
        return view
    }
    
    
    func openDetail(view: HomeViewProtocol, item: SuperHero) {
        let vc = DetailRouter().viewController as! DetailView
        vc.modalPopPup()
        vc.result = item
        if let newView = view as? UIViewController {
            newView.present(vc, animated: true, completion: nil)
        }
    }
}
