//
//  PokemonViewModel.swift
//  PokemonProject
//
//  Created by Luis Domingues on 22/03/20.
//  Copyright © 2020 Luis Domingues. All rights reserved.
//

import Foundation
import RealmSwift
import Kingfisher

struct PokemonView {
    var id = -1
    var name = ""
    var img = ""
    
    var urlImage: URL? {
        return URL(string: self.img)
    }
}

class PokemonViewModel {
    
    static func saveAll(objects: [Pokemon], clear: Bool = false) {
        if clear {
            return self.deleteAll()
        }
        
        try? uiRealm.write {
            uiRealm.add(objects, update: .all)
        }
    }
    
    static func getAsView(pokemon: Pokemon?) -> PokemonView {
        
        guard let pokemon = pokemon else {
            return PokemonView()
        }
        
        var pokemonView = PokemonView()
        pokemonView.id = pokemon.id.value ?? -1
        pokemonView.name = pokemon.name ?? ""
        pokemonView.img = pokemon.img ?? ""
        
        return pokemonView
    }
    
    static func get() -> [Pokemon] {
        let result = uiRealm.objects(Pokemon.self)
        
        var pokes: [Pokemon] = []
        pokes.append(contentsOf: result)
        
        return pokes
    }
    
    static func getAsView(pokes: [Pokemon]) -> [PokemonView] {
        var pokeView: [PokemonView] = []
        
        pokes.forEach { (pokemon) in
            pokeView.append(self.getAsView(pokemon: pokemon))
        }
        
        return pokeView
    }
    
    static func requestPokemon() -> [PokemonView] {
        return self.getAsView(pokes: self.get()).sorted(by: {$0.id < $1.id})
    }
    
    static func deleteAll() {
        let result = uiRealm.objects(Pokemon.self)
        
        try? uiRealm.write {
            uiRealm.delete(result)
        }
    }
}
