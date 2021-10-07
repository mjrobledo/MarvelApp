//
//
// Model.swift
// MarvelApp
//
// Using Swift 5.0
//
// Created by Ing. Miguel de Jesús Robledo Vera on 28/09/21.
// Copyright (c) 2021 and Confidential to ROBLEDO All rights reserved.
//


import Foundation
import ObjectMapper
import CryptoSwift


// MARK:- Model Request
struct RequestModel : Mappable {
    var ts: String = Constants.ts
    var apikey: String = Constants.publicKey
    var hash: String = (Constants.ts + Constants.privateKey + Constants.publicKey).md5()
    var limit: Int = 50
    var offset: Int?
        
    init?(map: Map) { }
    init() { }

    mutating func mapping(map: Map) {
        ts <- map["ts"]
        apikey <- map["apikey"]
        hash <- map["hash"]
        limit <- map["limit"]
        offset <- map["offset"]
    }
}
