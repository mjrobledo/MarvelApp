//
//
// HomeCell.swift
// MarvelApp
//
// Using Swift 5.0
//
// Created by Ing. Miguel de Jesús Robledo Vera on 28/09/21.
// Copyright (c) 2021 and Confidential to ROBLEDO All rights reserved.
//


import UIKit

class HomeCell: UITableViewCell {
    
    @IBOutlet weak var viewForm: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var imgAvatar: UIImageView!
   
        
    override func awakeFromNib() {
        super.awakeFromNib()
        viewForm.applyShadowWithCornerRadius()
        imgAvatar.applyShadowWithCornerRadius()
        // Initialization code
    }
    
    
    /// This method is responsible for filling the cell with the information of a Result
    /// - Parameter item: topo Results object obtained from the service
    func loadCell(item: Results) {
        lblTitle.text = item.name
        lblDescription.text = item.description ?? "" 
        
        let imagePath = item.thumbnail?.path ?? ""
        let imagePathExtension = item.thumbnail?.extensionFile ?? ""        
        imgAvatar.load(url: imagePath, size: .square_medium, mime: imagePathExtension, completion: nil)
    }
    
    
}
