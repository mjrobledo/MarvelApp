 //
 //
 // Data.swift
 // MarvelApp
 //
 // Using Swift 5.0
 //
 // Created by Ing. Miguel de Jesús Robledo Vera on 28/09/21.
 // Copyright (c) 2021 and Confidential to ROBLEDO All rights reserved.
 //

import Foundation
import ObjectMapper

struct Data : Mappable {
	var offset : Int?
	var limit : Int?
	var total : Int?
	var count : Int?
	var results : [Results]?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		offset <- map["offset"]
		limit <- map["limit"]
		total <- map["total"]
		count <- map["count"]
		results <- map["results"]
	}

}
