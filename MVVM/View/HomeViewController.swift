//
//  HomeViewController.swift
//  MVVM
//
//  Created by Thobio on 19/02/19.
//  Copyright © 2019 Zerone Consulting. All rights reserved.
//

import UIKit
import MapleBacon

class HomeViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet var pokemonViewModel :PokemonViewModel!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonViewModel.fetchPokemons {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonViewModel.numberOfItemsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"cells") as! PokemonTableViewCell
        configureCell(cell: cell,forRowAtIndexPath: indexPath)
        return cell
    }
    
    func configureCell(cell:PokemonTableViewCell,forRowAtIndexPath indexPath:IndexPath){
        cell.nameLabel?.text = pokemonViewModel.tittleForItemAtIndexPath(indexPath: indexPath)
        cell.subnameLabel?.text = pokemonViewModel.subTittleForItemAtIndexPath(indexPath: indexPath)
        cell.imagePokemon.setImage(with: URL(string:pokemonViewModel.imagePokemonForItemAtIndexPath(indexPath: indexPath)))
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 119.0
    }
}

