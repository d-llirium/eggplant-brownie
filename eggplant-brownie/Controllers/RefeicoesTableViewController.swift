//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Patricia de Lima Carlos on 16/06/21.
//  Copyright © 2021 Patricia Carlos. All rights reserved.
//

import UIKit
//vai herdar de UITableViewCOntroller
class RefeicoesTableViewController: UITableViewController{
    let refeicoes = [Refeicao(nome:"Macarrão", felicidade: 4),
                     Refeicao(nome:"Pizza", felicidade: 4),
                     Refeicao(nome:"Comida Japonesa", felicidade: 5)]
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //criando uma célula
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        //pega um elemento por vez
        let refeicao = refeicoes[indexPath.row]
        //coloca o elemento da reição como o label da celula
        celula.textLabel?.text = refeicao.nome
        
        return celula
    }
}
