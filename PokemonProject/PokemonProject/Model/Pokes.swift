//
//  Pokes.swift
//  PokemonProject
//
//  Created by Luis Domingues on 22/03/20.
//  Copyright © 2020 Luis Domingues. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class Pokes: Object, Mappable {
    
    @objc dynamic var name: String?
    @objc dynamic var url: String?

    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        self.name        <- map["name"]
        self.url         <- map["url"]
    }
}
