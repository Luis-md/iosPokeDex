//
//  Pokemon.swift
//  PokemonProject
//
//  Created by Luis Domingues on 22/03/20.
//  Copyright © 2020 Luis Domingues. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class Pokemon: Object, Mappable {
    
    var id = RealmOptional<Int>()
    @objc dynamic var name: String?
    @objc dynamic var img: String?

    required convenience init?(map: Map) {
        self.init()
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    func mapping(map: Map) {
        
        self.id.value       <- map["id"]
        self.name           <- map["name"]
        self.img            <- map["sprites.front_default"]
    }
}
