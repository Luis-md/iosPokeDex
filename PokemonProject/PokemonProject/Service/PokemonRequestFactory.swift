//
//  PokemonRequestFactory.swift
//  PokemonProject
//
//  Created by Luis Domingues on 22/03/20.
//  Copyright © 2020 Luis Domingues. All rights reserved.
//

import Foundation

import Alamofire

class PokemonRequestFactory {
    
    static func getList() -> DataRequest {
        let dataRequest = Alamofire.request(baseUrl, method: .get)
        return dataRequest
    }
    
    static func getPoke(url: String) -> DataRequest {
        return Alamofire.request(url, method: .get)
    }
}
