//
//  ViewController.swift
//  PokemonProject
//
//  Created by Luis Domingues on 07/03/20.
//  Copyright © 2020 Luis Domingues. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    var pokeList: [PokemonView] = []
    var pokeService: PokemonService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.config()
        self.pokeService = PokemonService(delegate: self)
        self.pokeService.getPokes()
    }
    
    fileprivate let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 100
        tableView.separatorStyle = .singleLine
        tableView.backgroundColor = UIColor(red:0.82, green:0.15, blue:0.10, alpha:1.00)
        
        return tableView
    }()


    private func config() {
        self.setupTableView()
        self.title = "Pokedex"
    }
    
    private func setupTableView() {
        self.view.addSubview(self.tableView)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(PokemonTableViewCell.self, forCellReuseIdentifier: "cell")
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pokeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pokemon = self.pokeList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PokemonTableViewCell
        cell.bind(pokemon)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
}

extension ViewController : PokemonServiceDelegate {
    func success() {
        self.pokeList = PokemonViewModel.requestPokemon()
        tableView.reloadData()
    }
    
    func failure(error: String) {
        print(error)
    }
}
