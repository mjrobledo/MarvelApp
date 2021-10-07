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
    
    
    var result: Results!
    
    let router = DetailRouter()
    let viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.bind(view: self, router: router)
        self.setUp()
        
        DispatchQueue.main.async {
            if let characterID = self.result.id {
                self.viewModel.getCharacterID(characterId: characterID)
            }
        }
    }
    
    func setUp() {
        viewAvatar.round()
        viewForm.round(radius: 5)
        
        lblName.text = result?.name
        lblDescription.text = result?.description
        // Do any additional setup after loading the view.
        
        let imagePath = result.thumbnail?.path ?? ""
        let imagePathExtension = result.thumbnail?.extensionFile ?? ""
        
        imgAvatar.load(url: imagePath, size: .square_medium, mime: imagePathExtension, completion: nil)
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goToLink(_ sender: UIButton) {
        if let typeLink = TypeLink(rawValue: sender.tag) {
            viewModel.openLink(link: typeLink)
        }
    }
    
    
}

// MARK: - Functions Output viewmodel
extension DetailView {
    
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
