 //
 //
 // Results.swift
 // MarvelApp
 //
 // Using Swift 5.0
 //
 // Created by Ing. Miguel de Jesús Robledo Vera on 28/09/21.
 // Copyright (c) 2021 and Confidential to ROBLEDO All rights reserved.
 //

import Foundation
import ObjectMapper

struct Results : Mappable {
	var id : Int?
	var name : String?
	var description : String?
	var modified : String?
	var thumbnail : Thumbnail?
	var resourceURI : String?
	var comics : Comics?
	var series : Series?
	var stories : Stories?
	var events : Events?
	var urls : [Urls]?

    var title : String?
    var start : String?
    var end : String?
    
	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		id <- map["id"]
		name <- map["name"]
		description <- map["description"]
		modified <- map["modified"]
		thumbnail <- map["thumbnail"]
		resourceURI <- map["resourceURI"]
		comics <- map["comics"]
		series <- map["series"]
		stories <- map["stories"]
		events <- map["events"]
		urls <- map["urls"]
        
        title <- map["title"]
        start <- map["start"]
        end <- map["end"]
	}

}
