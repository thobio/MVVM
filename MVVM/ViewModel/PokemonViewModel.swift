//
//  PokemonViewModel.swift
//  MVVM
//
//  Created by Thobio on 19/02/19.
//  Copyright © 2019 Zerone Consulting. All rights reserved.
//

import UIKit


class PokemonViewModel: NSObject {
    @IBOutlet var dataBaseClass:PokemonCoreDataCURD?
    @IBOutlet var pokemonsClient:PokemonClient?
    var pokemons:[PokemonDataModel]?
    
    func fetchPokemons(completion:@escaping () -> ()){
        pokemonsClient!.fetchPokemons{ pokemons,error  in
            if error == "" {
                let pokemonss = pokemons
                self.pokemons = self.groupPokeList(pokeList: pokemonss)
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
    func groupPokeList(pokeList:[PokemonDataModel]) -> [PokemonDataModel] {
        var pokemonSortedList : [PokemonDataModel] = []
        var candyTemp : String?
        for i in 0..<pokeList.count {
            let pokemons = pokeList[i]
            if candyTemp != nil {
                if pokemons.candy == candyTemp {
                    // nothing to add here
                }
                else if pokemons.candy == "None" {
                    pokemonSortedList.append(pokemons)
                }else{
                    pokemonSortedList.append(pokemons)
                    candyTemp = pokemons.candy
                }
            }else{
                candyTemp = pokemons.candy
                pokemonSortedList.append(pokemons)
            }
        }
        return pokemonSortedList
    }
}
