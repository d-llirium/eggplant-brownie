//
//  Item.swift
//  eggplant-brownie
//
//  Created by Patricia de Lima Carlos on 14/06/21.
//  Copyright © 2021 Patricia Carlos. All rights reserved.
//

import UIKit

class Item: NSObject {
    //MARK: - atributos
    var nome: String
    var calorias:Double
    //MARK: - construtor
    init(nome: String, calorias:Double){
        self.nome = nome
        self.calorias = calorias
    }
}
