//
//  PokemonCoreDataCURD.swift
//  MVVM
//
//  Created by Thobio on 20/02/19.
//  Copyright © 2019 Zerone Consulting. All rights reserved.
//

import UIKit
import CoreData

class PokemonCoreDataCURD:NSObject {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func createPokemonList(pokemonList:[PokemonDataModel]){
        let context = appDelegate.persistentContainer.viewContext
        for pokemon in pokemonList {
            let newPokemon = PokemonDex(context: context)
            newPokemon.id = Int16(pokemon.id)
            newPokemon.name = pokemon.name
            newPokemon.image = pokemon.image
            newPokemon.candy = pokemon.candy
            newPokemon.num = pokemon.num
            newPokemon.weight = pokemon.weight
            newPokemon.height = pokemon.height
            for i in 0..<pokemon.type.count {
                let typesPoke = Type(context: context)
                typesPoke.types = pokemon.type[i]
                newPokemon.addToTypes(typesPoke)
            }
            for i in 0..<pokemon.weaknesses.count {
                let weaknesses = Weaknesses(context: context)
                weaknesses.weaknesses = pokemon.weaknesses[i]
                newPokemon.addToWeaknessespok(weaknesses)
            }
            for i in pokemon.nextEvolutions! {
                let nextEvolution = Next_Evolution(context: context)
                nextEvolution.num = i.num
                nextEvolution.name = i.name
                newPokemon.addToNextEv(nextEvolution)
            }
            appDelegate.saveContext()
        }
    }
    func readPokemonListDataBase(){
        let context = appDelegate.persistentContainer.viewContext
    }
}
