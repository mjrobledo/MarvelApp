//
//
// DetailViewModel.swift
// MarvelApp
//
// Using Swift 5.0
//
// Created by Ing. Miguel de Jesús Robledo Vera on 06/10/21.
// Copyright (c) 2021 and Confidential to ROBLEDO All rights reserved.
//


import Foundation

class DetailViewModel {
   
    weak var view: DetailViewProtocol?
    var router: DetailRouterProtocol?
  
    private var manager = DataManager()
    
    var response : ResponseModel!
    
    /// Function in charge of obtaining the information of a character. Validate the information from Wiki,
    /// comics, series, stories and events to later configure and fill the view with the information
    /// - Parameter characterId: Superhero id
    private func getSuperHeroID(characterId: Int) {
        self.view?.showLoader()
        let request = RequestModel()
        manager.getContent(characterId: characterId, request: request) { (response) in
            self.view?.hideLoader()
            if response?.code == 200 {
                if let result = response {
                    self.response = result
                    if let copyright = result.copyright {
                        self.view?.setCopyright(copyright: copyright)
                    }
                
                    guard let data = result.data else {
                        return
                    }
                    
                    if let res = data.results?.first {
                        let wiki = res.urls?.contains(where: {$0.type == TypeLink.wiki.linkString })
                        let detail = res.urls?.contains(where: {$0.type == TypeLink.detail.linkString })
                        let comic = res.urls?.contains(where: {$0.type == TypeLink.comics.linkString })
                        
                        self.view!.setLinks(wiki: wiki == false, detail: detail ?? false, comics: comic ?? false)
                    
                        let comics = res.comics?.available ?? 0
                        let series = res.series?.available ?? 0
                        let stories = res.stories?.available ?? 0
                        let events = res.events?.available ?? 0
                        
                        self.view!.setInfo(comic: comics, series: series, stories: stories, events: events)
                    }
                }
            } else {
                self.view?.alert(title: "", message: Constants.Text.connectionError)
            }
        }
    }
    
}


extension DetailViewModel: DetailPresenterProtocol {
    func back() {
        router?.back(view: self.view!)
    }
    
    func getCharacterID(characterId: Int) {
        self.getSuperHeroID(characterId: characterId)
    }
    
    func viewDidLoad() {
        
    }    
    
    /// Open a web page based on the expected type (Wiki, detail, comic)
    /// - Parameter link: Tipme enum Int (wiki = 1 detail = 2 comics = 3)
    func openLink(link: TypeLink) {
        if let urlString = response.data?.results?.first?.urls?.first(where: { $0.type == link.linkString}) {
            if let url = URL(string: urlString.url ?? "") {
                self.router!.openLink(link: url)
            } else {
                self.view?.alert(title: "Error", message: "Link not found")
            }
        }
    }
}

// MARK: - Protocols
protocol DetailViewProtocol: class {
    // VIEWMODEL -> VIEW
    var viewModel: DetailPresenterProtocol? { get set }
        
    func showLoader()
    func hideLoader()
    func alert(title: String, message: String)
    func setCopyright(copyright: String)
    func setLinks(wiki: Bool, detail: Bool, comics: Bool)
    func setInfo(comic: Int, series: Int, stories: Int, events: Int)
}

protocol DetailPresenterProtocol: class {
    // VIEW -> VIEWMODEL
    var view: DetailViewProtocol? { get set }
    var router: DetailRouterProtocol? { get set }
    
    func viewDidLoad()
    func openLink(link: TypeLink)
    func getCharacterID(characterId: Int)
    func back()
    
}

protocol DetailRouterProtocol: class {
    // VIEWMODEL -> Router
    func openLink(link: URL)
    func back(view: DetailViewProtocol)
}
