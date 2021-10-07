//
//
// Constans.swift
// MarvelApp
//
// Using Swift 5.0
//
// Created by Ing. Miguel de Jesús Robledo Vera on 28/09/21.
// Copyright (c) 2021 and Confidential to ROBLEDO All rights reserved.
//


import Alamofire
import UIKit

struct Constants {    

    /// Add  public key in Schemes -> Edit Scheme -> Environment Variables -> PUBLIC_KEY.
    public static let publicKey = ProcessInfo.processInfo.environment["PUBLIC_KEY"] ?? ""
    
    /// Add private key in Schemes -> Edit Scheme -> Environment Variables -> PRIVATE_KEY.
    public static let privateKey = ProcessInfo.processInfo.environment["PRIVATE_KEY"] ?? ""
    
    static let ts = UUID().uuidString.replacingOccurrences(of: "-", with: "").lowercased()
    
    struct Endpoints {
        static let url = "https://gateway.marvel.com"
        
        static let characters = "/v1/public/characters"
        
        static var apiCharacters: String {
            return "\(url)\(characters)"
        }
    }
    
    struct Text {
        static let titleHome = "MARVEL APP"
        static let notAuthorized = "Not authorized"
        static let connectionError = "Connection error"
        static let parsingFailed = "Parsing Failed"
        static let noResultsFound = "No results found"
    }
    
}

struct Connectivity {
  static let sharedInstance = NetworkReachabilityManager()!
  static var isConnectedToInternet:Bool {
      return self.sharedInstance.isReachable
    }
}
