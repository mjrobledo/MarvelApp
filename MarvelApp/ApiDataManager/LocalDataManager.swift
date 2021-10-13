//
//
// CoreData.swift
// MarvelApp
//
// Using Swift 5.0
//
// Created by Ing. Miguel de Jesús Robledo Vera on 28/09/21.
// Copyright (c) 2021 and Confidential to ROBLEDO All rights reserved.
//


import Foundation

class LocalDataManager {
    
    /// This method saves the information on the device
    /// - Parameter result: Results type array
    func saveLastResult(result: [SuperHero]) {
        UserDefaults.standard.set(result.toJSON(), forKey: "data")
    }

    func getResult() -> [SuperHero] {
        var result = [SuperHero]()
        if let data = UserDefaults.standard.array(forKey: "data") as? [[String: Any]] {
            print(data)
            for item in data {
                if let json = SuperHero(JSON: item) {
                    result.append(json)
                }
            }
        }
        return result
    }
}
