//
//  PokemonService.swift
//  PokemonProject
//
//  Created by Luis Domingues on 22/03/20.
//  Copyright © 2020 Luis Domingues. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

protocol PokemonServiceDelegate {
    func success()
    func failure(error: String)
}

class PokemonService {
    
    var delegate: PokemonServiceDelegate!
    
    init(delegate: PokemonServiceDelegate) {
        self.delegate = delegate
    }
    
    private func fetchPokemon(url: String) {
        PokemonRequestFactory.getPoke(url: url).validate().responseObject { (response: DataResponse<Pokemon>) in
            
            switch response.result {
            case .success:
                if let pokemon = response.result.value {
                    PokemonViewModel.saveAll(objects: [pokemon])
                }
                self.delegate.success()
            case .failure(let error):
                self.delegate.failure(error: error.localizedDescription)
            }
        }
    }
    
    func getPokes() {
        PokemonRequestFactory.getList().validate().responseArray(keyPath: "results") { (response: DataResponse<[Pokes]>) in
            
            switch response.result {
            case .success:
                if let pokeList = response.result.value {
                    pokeList.forEach { (poke) in
                        self.fetchPokemon(url: poke.url!)
                    }
                }
                self.delegate.success()
            case .failure(let error):
                self.delegate.failure(error: error.localizedDescription)
            }
        }
    }
    
    
    
}
