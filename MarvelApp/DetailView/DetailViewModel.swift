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
    private weak var view: DetailView?
    private weak var router: DetailRouter?
    
    private var manager = HomeManagerConection()
    
    var response : ResponseModel!
    
    func bind(view: DetailView, router: DetailRouter) {
        self.view = view
        self.router = router
        self.router?.setSourceView(view)
    }
    
    /// Function in charge of obtaining the information of a character. Validate the information from Wiki,
    /// comics, series, stories and events to later configure and fill the view with the information
    /// - Parameter characterId: Superhero id
    func getCharacterID(characterId: Int) {
        self.view?.showIndicator()
        let request = RequestModel()
        manager.getContent(characterId: characterId, request: request) { (response) in
            self.view?.hideIndicator()
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
                self.view?.simpleAlert(title: "", message: Constants.Text.connectionError)
            }
        }
    }
    
    
    func openLink(link: TypeLink) {
        if let urlString = response.data?.results?.first?.urls?.first(where: { $0.type == link.linkString}) {
            if let url = URL(string: urlString.url ?? "") {
                self.router!.openLink(link: url)
            } else {
                self.view?.simpleAlert(title: "Error", message: "Link not found")
            }
        }
    }
}
