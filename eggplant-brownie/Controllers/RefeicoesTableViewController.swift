//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Patricia de Lima Carlos on 16/06/21.
//  Copyright © 2021 Patricia Carlos. All rights reserved.
//

import UIKit

class RefeicoesTableViewController: UITableViewController, AdicionaRefeicaoDelegate{
    //MARK: - ATRIBUTOS
    var refeicoes = [Refeicao(nome:"Macarrão", felicidade: 4),
                     Refeicao(nome:"Pizza", felicidade: 4),
                     Refeicao(nome:"Comida Japonesa", felicidade: 5)]
    //MARK: - MÉTODOS
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row]
        celula.textLabel?.text = refeicao.nome
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(mostrarDetalhes(_: )))
        celula.addGestureRecognizer(longPress)
        
        return celula
    }
    @objc func mostrarDetalhes(_ gesture: UILongPressGestureRecognizer){
        if gesture.state == .began{
            let celula = gesture.view as! UITableViewCell
            guard let indexPath = tableView.indexPath(for: celula) else { return }
            let refeicao = refeicoes[indexPath.row]
           
            let alerta = UIAlertController(title: refeicao.nome, message: refeicao.detalhes(), preferredStyle: .alert)
            let botaoCancelar = UIAlertAction(title: "ok", style: .cancel, handler: nil)
            
            alerta.addAction(botaoCancelar)
            
            present(alerta, animated: true, completion: nil)
        }
    }
        
    //MARK: - add info and reload table view
    func add(_ refeicao: Refeicao){
        //adiciona o item a lista array
        refeicoes.append(refeicao)
        //atualiza a table view
        tableView.reloadData()
    }
    
    //MARK:- passando info entre CONTROLLERS
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "adicionar" {
            if let viewController = segue.destination as? ViewController {
                viewController.delegate = self
            }
        }
    }
}
