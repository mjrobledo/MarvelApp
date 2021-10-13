//
//
// DetailView.swift
// MarvelApp
//
// Using Swift 5.0
//
// Created by Ing. Miguel de Jesús Robledo Vera on 06/10/21.
// Copyright (c) 2021 and Confidential to ROBLEDO All rights reserved.
//


import UIKit

class DetailView: UIViewController {
    var viewModel: DetailPresenterProtocol?
    
    @IBOutlet weak var viewUrls: UIView!
    @IBOutlet weak var viewWiki: UIView!
    @IBOutlet weak var viewDetail: UIView!
    @IBOutlet weak var viewComics: UIView!
    
    @IBOutlet weak var viewAvatar: UIView!
    @IBOutlet weak var viewForm: UIView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblCopyright: UILabel!
    
    @IBOutlet weak var lblComics: UILabel!
    @IBOutlet weak var lblSeries: UILabel!
    @IBOutlet weak var lblStories: UILabel!
    @IBOutlet weak var lblEvents: UILabel!
    
    
    var result: SuperHero!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUp()
        
        DispatchQueue.main.async {
            self.viewModel!.getCharacterID(characterId: self.result.id) 
        }
    }
    
    func setUp() {
        viewAvatar.round()
        viewForm.round(radius: 5)
        
        lblName.text = result?.name
        lblDescription.text = result?.description
        // Do any additional setup after loading the view.
        
        let imagePath = result.path
        let imagePathExtension = result.extensionFile
        
        imgAvatar.load(url: imagePath, size: .square_medium, mime: imagePathExtension, completion: nil)
    }
    
    @IBAction func back(_ sender: Any) {
        viewModel!.back()
    }
    
    @IBAction func goToLink(_ sender: UIButton) {
        if let typeLink = TypeLink(rawValue: sender.tag) {
            viewModel!.openLink(link: typeLink)
        }
    }
        
}

// MARK: - Functions Output viewmodel
extension DetailView: DetailViewProtocol {
    func showLoader() {
        self.showIndicator()
    }
    
    func hideLoader() {
        self.hideIndicator()
    }
    
    func alert(title: String, message: String) {
        self.simpleAlert(title: title, message: message)
    }
    
    
    func setCopyright(copyright: String) {
        lblCopyright.text = copyright
    }
    
    func setLinks(wiki: Bool, detail: Bool, comics: Bool) {
        viewWiki.isHidden = !wiki
        viewDetail.isHidden = !detail
        viewComics.isHidden = !comics
    }
    
    func setInfo(comic: Int, series: Int, stories: Int, events: Int) {
        lblComics.text = comic.description
        lblSeries.text = series.description
        lblStories.text = stories.description
        lblEvents.text = events.description
    }
}

enum TypeLink: Int {
    case wiki = 1
    case detail = 2
    case comics = 3
    
    var linkString: String {
        switch self {
        case .wiki:
            return "wiki"
        case .detail:
            return "detail"
        case .comics:
            return "comiclink"
        }
    }
}
