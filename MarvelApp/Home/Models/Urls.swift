 //
 //
 // Urls.swift
 // MarvelApp
 //
 // Using Swift 5.0
 //
 // Created by Ing. Miguel de Jesús Robledo Vera on 28/09/21.
 // Copyright (c) 2021 and Confidential to ROBLEDO All rights reserved.
 //

import Foundation
import ObjectMapper

struct Urls : Mappable {
	var type : String?
	var url : String?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		type <- map["type"]
		url <- map["url"]
	}

}
