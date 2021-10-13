 //
 //
 // ResponseModel.swift
 // MarvelApp
 //
 // Using Swift 5.0
 //
 // Created by Ing. Miguel de Jesús Robledo Vera on 28/09/21.
 // Copyright (c) 2021 and Confidential to ROBLEDO All rights reserved.
 //

import Foundation
import ObjectMapper

struct ResponseModel : Mappable {
	var code : Int?
	var status : String?
	var copyright : String?
	var attributionText : String?
	var attributionHTML : String?
	var etag : String?
	var data : Data?

    var message: String = ""
    
	init?(map: Map) {

	}
    
    init(code: Int, message: String) {
        self.code = code
        self.message = message
    }

	mutating func mapping(map: Map) {

		code <- map["code"]
		status <- map["status"]
		copyright <- map["copyright"]
		attributionText <- map["attributionText"]
		attributionHTML <- map["attributionHTML"]
		etag <- map["etag"]
		data <- map["data"]
	}

}
