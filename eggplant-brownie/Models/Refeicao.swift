//
//  Refeicao.swift
//  eggplant-brownie
//
//  Created by Patricia de Lima Carlos on 14/06/21.
//  Copyright © 2021 Patricia Carlos. All rights reserved.
//

import UIKit

class Refeicao: NSObject {
    //MARK: - atributos
     let nome: String
     let felicidade: Int
     var itens: Array<Item> = []
    
     //MARK: - construtor
    init(nome:String,felicidade:Int, itens: [Item] = []){
         self.nome = nome
         self.felicidade = felicidade
        self.itens = itens
     }
     //MARK: - métodos
     func totalDeCalorias() -> Double{
         var total = 0.0
         
         for item in itens {
             total += item.calorias
         }
         return total
     }
    func detalhes()-> String{
        var mensagem = "Felicidade: \(felicidade)"
        for item in itens {
            mensagem += ", \(item.nome) - calorias: \(item.calorias)"
        }
        return mensagem
    }
}
