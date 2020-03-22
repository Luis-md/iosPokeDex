//
//  PokemoneTableViewCell.swift
//  PokemonProject
//
//  Created by Luis Domingues on 21/03/20.
//  Copyright © 2020 Luis Domingues. All rights reserved.
//

import UIKit
import Kingfisher

class PokemonTableViewCell: UITableViewCell {

    fileprivate let txtLabel: UILabel = {
        let txt = UILabel(frame: .zero)
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.font = txt.font.withSize(20)
        
        return txt
    }()
    
    fileprivate let imgLabel: UIImageView = {
       let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .center
        
        return img
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.config()
     }
    
     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    func bind(_ pokemon: PokemonView) {
        self.txtLabel.text = pokemon.name
        self.imgLabel.kf.setImage(with: pokemon.urlImage)
    }
    
    private func config() {
        setupImg()
        self.setupTxt()
    }
    
    private func setupTxt() {
        self.addSubview(self.txtLabel)
        
        NSLayoutConstraint.activate([
            self.txtLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.txtLabel.leftAnchor.constraint(equalTo: self.imgLabel.rightAnchor, constant: 16)
        ])
    }
    
    private func setupImg() {
        self.addSubview(self.imgLabel)
        
        NSLayoutConstraint.activate([
            self.imgLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.imgLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24),
            self.imgLabel.widthAnchor.constraint(equalToConstant: 50),
            self.imgLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    
}


