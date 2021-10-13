 //
 //
 // Comics.swift
 // MarvelApp
 //
 // Using Swift 5.0
 //
 // Created by Ing. Miguel de Jesús Robledo Vera on 28/09/21.
 // Copyright (c) 2021 and Confidential to ROBLEDO All rights reserved.
 //

import Foundation
import ObjectMapper

struct Comics : Mappable {
	var available : Int?
	var collectionURI : String?
	var items : [Items]?
	var returned : Int?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		available <- map["available"]
		collectionURI <- map["collectionURI"]
		items <- map["items"]
		returned <- map["returned"]
	}

}
