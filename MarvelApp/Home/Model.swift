//
//
// Models.swift
// MarvelApp
//
// Using Swift 5.0
//
// Created by Ing. Miguel de Jesús Robledo Vera on 13/10/21.
// Copyright (c) 2021 and Confidential to ROBLEDO All rights reserved.
//


import ObjectMapper

struct SuperHero : Mappable {
    
    var id: Int = 0
    var name: String = ""
    var description: String = ""
    var path: String = ""
    var extensionFile: String  = ""
        
    init(id: Int, name: String, description: String, path: String, extensionFile: String) {
        self.id = id
        self.name = name
        self.description = description
        self.path = path
        self.extensionFile = extensionFile
    }
    
    init?(map: Map) {

    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        description <- map["description"]
        extensionFile <- map["extensionFile"]
    }
}
