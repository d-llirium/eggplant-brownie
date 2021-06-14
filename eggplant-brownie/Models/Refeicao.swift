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
     var nome: String
     var felicidade: String
     //inicializada vazia
     var itens: Array<Item> = []
     //MARK: - construtor
     //os tipos precisam estar explícitos na hora de colocar os parametros
     init(nome:String,felicidade:String){
         self.nome = nome
         self.felicidade = felicidade
     }
     //MARK: - métodos
     func totalDeCalorias() -> Double{
         var total = 0.0
         
         for item in itens {
             total += item.calorias
         }
         return total
     }
}
