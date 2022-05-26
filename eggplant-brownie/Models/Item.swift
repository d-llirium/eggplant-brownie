//
//  Item.swift
//  eggplant-brownie
//
//  Created by Patricia de Lima Carlos on 14/06/21.
//  Copyright © 2021 Patricia Carlos. All rights reserved.
//

import UIKit

class Item: NSObject
            , NSCoding
{
    //MARK: - atributos
    let nome: String
    let calorias:Double
    
    //MARK: - construtor
    init(
        nome: String
        , calorias:Double
    ){
        self.nome = nome
        self.calorias = calorias
    }
    //MARK: - NSCoding
    func encode( with coder: NSCoder ) {
        coder.encode(
            nome
            , forKey: "nome"
        )
        coder.encode(
            calorias
            , forKey: "calorias"
        )
    }
    
    required init?( coder: NSCoder )
    {
        nome = coder.decodeObject( forKey: "nome" ) as! String
        calorias = coder.decodeDouble( forKey: "calorias" )
    }
}
