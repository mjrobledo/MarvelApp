 //
 //
 // Thumbnail.swift
 // MarvelApp
 //
 // Using Swift 5.0
 //
 // Created by Ing. Miguel de Jesús Robledo Vera on 28/09/21.
 // Copyright (c) 2021 and Confidential to ROBLEDO All rights reserved.
 //

import Foundation
import ObjectMapper

struct Thumbnail : Mappable {
	var path : String?
	var extensionFile : String?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		path <- map["path"]
        extensionFile <- map["extension"]
	}

}
