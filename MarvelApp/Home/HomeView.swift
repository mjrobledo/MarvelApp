//
//
// HomeView.swift
// MarvelApp
//
// Using Swift 5.0
//
// Created by Ing. Miguel de Jesús Robledo Vera on 28/09/21.
// Copyright (c) 2021 and Confidential to ROBLEDO All rights reserved.
//


import UIKit

class HomeView: UIViewController {
    
    let router = HomeRouter()
    let viewModel = HomeViewModel()
    
    @IBOutlet weak var tblContent: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.bind(view: self, router: router)
        self.setUp()
        // Do any additional setup after loading the view.
        viewModel.viewDidLoad()
    } 
    
    private func setUp() {
        tblContent.register(UINib(nibName: "HomeCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    func reloadTable() {
        tblContent.reloadData()
    }
    
    func alert(message: String) {
        self.simpleAlert(title: "", message: message)
    }
}


extension HomeView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! HomeCell
        
        cell.loadCell(item: viewModel.items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = viewModel.items[indexPath.row]
        viewModel.openDetail(item: item)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == viewModel.items.count - 10 {
            DispatchQueue.main.async { [self] in
                self.viewModel.getContent()
            }
        }
    }
}
