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
    func saveLastResult(result: [Results]) {
        UserDefaults.standard.set(result.toJSON(), forKey: "data")
    }

    func getResult() -> [Results] {
        var result = [Results]()
        if let data = UserDefaults.standard.array(forKey: "data") as? [[String: Any]] {
            print(data)
            for item in data {
                result.append(Results(JSON: item)!)
            }
        }
        return result
    }
}
