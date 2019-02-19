//
//  PokemonDataModel.swift
//  MVVM
//
//  Created by Thobio on 19/02/19.
//  Copyright © 2019 Zerone Consulting. All rights reserved.
//

import UIKit

class PokemonDataModel {
    var id : Int = 0
    var name:String?
    var image : String?
    var type : [String] = []
    var height:String?
    var weight :String?
    var candy :String?
    var num :String?
    var weaknesses : [String] = []
    var nextEvolutions : [nextEvolution]?
}

class nextEvolution {
    var num:String?
    var name:String?
}

