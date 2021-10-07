 //
 //
 // Items.swift
 // MarvelApp
 //
 // Using Swift 5.0
 //
 // Created by Ing. Miguel de Jesús Robledo Vera on 28/09/21.
 // Copyright (c) 2021 and Confidential to ROBLEDO All rights reserved.
 //

import Foundation
import ObjectMapper

struct Items : Mappable {
	var resourceURI : String?
	var name : String?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		resourceURI <- map["resourceURI"]
		name <- map["name"]
	}

}
