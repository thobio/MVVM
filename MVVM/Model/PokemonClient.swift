//
//  PokemonClient.swift
//  MVVM
//
//  Created by Thobio on 19/02/19.
//  Copyright © 2019 Zerone Consulting. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class PokemonClient:NSObject {
    
    let url = "https://raw.githubusercontent.com/Biuni/PokemonGo-pokedex/master/pokedex.json"
    
    func fetchPokemons(completion: @escaping (_ pokemons:[PokemonDataModel],_ errorsHA: String) -> ()){
        var pokemonsList : [PokemonDataModel]?
        Alamofire.request(url, method: .get, parameters:nil, encoding: URLEncoding.default, headers:nil).responseJSON { (response) in
            if response.result.isSuccess {
                let pokemonJSON:JSON = JSON(response.result.value!)
                pokemonsList = self.pokemonListValues(pokemonJson: pokemonJSON["pokemon"])
                completion(pokemonsList!,"")
            }else{
                completion([], "Connection Issues")
                print("Connection Issues")
            }
        }
    }
    
    func pokemonListValues(pokemonJson:JSON) -> [PokemonDataModel]{
        var pokemons : [PokemonDataModel] = []
        for i in 0..<pokemonJson.count {
            let pokemon = pokemonJson[i]
            let newPokemon = PokemonDataModel()
            newPokemon.id = pokemon["id"].intValue
            newPokemon.name = pokemon["name"].stringValue
            newPokemon.image = pokemon["img"].stringValue
            newPokemon.candy = pokemon["candy"].stringValue
            newPokemon.num = pokemon["num"].stringValue
            var typesPoke:[String] = []
            for j in 0..<pokemon["type"].count {
                typesPoke.append(pokemon["type"][j].stringValue)
            }
            newPokemon.type = typesPoke
            newPokemon.weight = pokemon["weight"].stringValue
            newPokemon.height = pokemon["height"].stringValue
            var weaknesses:[String] = []
            for k in 0..<pokemon["weaknesses"].count {
                weaknesses.append(pokemon["weaknesses"][k].stringValue)
            }
            newPokemon.weaknesses = weaknesses
            let pokemonNextEvolution = pokemon["next_evolution"]
            var nextEvolutions:[nextEvolution] = []
            for l in 0..<pokemonNextEvolution.count {
                let next = nextEvolution()
                next.num = pokemonNextEvolution[l]["num"].stringValue
                next.name = pokemonNextEvolution[l]["name"].stringValue
                nextEvolutions.append(next)
            }
            newPokemon.nextEvolutions = nextEvolutions
          pokemons.append(newPokemon)
        }
        return pokemons
    }
    
}
