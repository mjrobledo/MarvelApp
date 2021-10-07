//
//
// HomeViewModel.swift
// MarvelApp
//
// Using Swift 5.0
//
// Created by Ing. Miguel de Jesús Robledo Vera on 28/09/21.
// Copyright (c) 2021 and Confidential to ROBLEDO All rights reserved.
//


import Foundation


class HomeViewModel {
    private weak var view: HomeView?
    private weak var router: HomeRouter?
    
    private var manager = HomeManagerConection()
    private var localManager = LocalDataManager()
    
    /// The search result is assigned to you
    var items = [Results]()
    
    var offset = 0
    
    func bind(view: HomeView, router: HomeRouter) {
        self.view = view
        self.router = router
        self.router?.setSourceView(view)
    }    
    
    func viewDidLoad() {
        self.view?.title = Constants.Text.titleHome
        self.getContent()
    }
     
    
    /// Validate if you have internet to obtain local or service data
    func getContent() {
        if Connectivity.isConnectedToInternet {
            self.getContentToApi()
        } else {
            self.items = localManager.getResult()
            self.view?.reloadTable()
        }
    }
    
    
    /// Method in charge of obtaining the information of the service
    private func getContentToApi() {
        view?.showIndicator()
        var request = RequestModel()
        request.offset = offset
        manager.getContent(request: request, completion: { (response) in
            self.view?.hideIndicator()
            if let data = response?.data?.results {
                if !data.isEmpty {
                    self.items.append(contentsOf: data)
                    self.view?.reloadTable()
                    self.localManager.saveLastResult(result: self.items)
                    self.offset = self.offset + self.items.count
                }
            } else {
                self.view?.alert(message: Constants.Text.noResultsFound)
            }
        })
    }
    
    
    func openDetail(item: Results) {
        router?.openDetailView(item: item)
    }
}

