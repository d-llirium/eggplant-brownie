//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Patricia de Lima Carlos on 16/06/21.
//  Copyright © 2021 Patricia Carlos. All rights reserved.
//

import UIKit
//vai herdar de UITableViewCOntroller com o protocolo ViewControllerDelegate - q será utilizado para interfacear as duas views
class RefeicoesTableViewController: UITableViewController, ViewControllerDelegate{
    var refeicoes = [Refeicao(nome:"Macarrão", felicidade: 4),
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
    //MARK: - add info and reload table view
    func add(_ refeicao: Refeicao){
        //adiciona o item a lista array
        refeicoes.append(refeicao)
        //atualiza a table view
        tableView.reloadData()
    }
    //MARK:- passando info entre CONTROLLERS
    //recebe a sequencia da telas e manda para q um destino
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //se o segue for o "adicionar"
        if segue.identifier == "adicionar" {
            //se o destino for convertido para ViewController
            if let viewController = segue.destination as? ViewController {
                //então o destino que é um tipo genérico q era UITableView Controller agora é a instancia tableViewController
                viewController.delegate = self
            }
        }
    }
}
