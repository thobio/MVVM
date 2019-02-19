//
//  PokemonViewModel.swift
//  MVVM
//
//  Created by Thobio on 19/02/19.
//  Copyright © 2019 Zerone Consulting. All rights reserved.
//

import UIKit


class PokemonViewModel: NSObject {
    @IBOutlet var pokemonsClient:PokemonClient?
    var pokemons:[PokemonDataModel]?
    func fetchPokemons(completion:@escaping () -> ()){
        pokemonsClient!.fetchPokemons{ pokemons,error  in
            if error == "" {
                self.pokemons = pokemons
                completion()
            }else{
                self.pokemons = pokemons
                completion()
                // errors
            }
        }
    }
    func numberOfItemsInSection(section:Int)->Int{
        return pokemons?.count ?? 0
    }
    func tittleForItemAtIndexPath(indexPath: IndexPath)-> String {
        return pokemons![indexPath.row].name!
    }
    func subTittleForItemAtIndexPath(indexPath: IndexPath)-> String {
        return pokemons![indexPath.row].candy!
    }
    func imagePokemonForItemAtIndexPath(indexPath: IndexPath)-> String {
        return pokemons![indexPath.row].image!
    }
    
}
