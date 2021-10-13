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
    weak var view: HomeViewProtocol?
    var router: HomeRouterProtocol?     
    
    private var manager = DataManager()
    private var localManager = LocalDataManager() 
    
    /// The search result is assigned to you
    var items: [SuperHero]! = []
    
    var offset = 0
     
    /// Method in charge of obtaining the information of the service
    private func getContentToApi() {
        view?.showLoader()
        var request = RequestModel()
        request.offset = offset
        manager.getContent(request: request, completion: { (response) in
            self.view?.hideLoader()
            if let data = response?.data?.results {
                if !data.isEmpty {
                    self.items = data.map { (result) -> SuperHero in
                        return SuperHero(id: result.id ?? 0, name: result.name ?? "", description: result.description ?? "", path: result.thumbnail?.path ?? "", extensionFile: result.thumbnail?.extensionFile ?? "")
                    }
                    self.view?.reloadTable()
                    self.localManager.saveLastResult(result: self.items)
                    self.offset = self.offset + self.items.count
                }
            } else {
                self.view?.alert(message: Constants.Text.noResultsFound)
            }
        })
    }
}

extension HomeViewModel: HomePresenterProtocol {
    func viewDidLoad() {
        self.getContent()
    }
    
    func openDetail(item: SuperHero) {
        router?.openDetail(view: self.view!, item: item)
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
}

// MARK: - Protocols
protocol HomeViewProtocol: class {
    // VIEWMODEL -> VIEW
    var viewModel: HomePresenterProtocol? { get set }
        
    func showLoader()
    func hideLoader()
    func reloadTable()
    func alert(message: String)
}

protocol HomePresenterProtocol: class {
    // VIEW -> VIEWMODEL
    var view: HomeViewProtocol? { get set }
    var router: HomeRouterProtocol? { get set }
    var items: [SuperHero]! { get set }
    
    func viewDidLoad()
    func openDetail(item: SuperHero)
    func getContent()
}

protocol HomeRouterProtocol: class {
    // VIEWMODEL -> Router
    func openDetail(view: HomeViewProtocol, item: SuperHero)    
}
