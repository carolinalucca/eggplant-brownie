//
//  Item.swift
//  eggplant-brownie
//
//  Created by Carolina Lucca on 14/04/20.
//  Copyright © 2020 Carolina Lucca. All rights reserved.
//

import UIKit

class Item: NSObject {
    
    let nome: String
    let calorias: Double
    
    init(nome: String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }

}
