//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Patricia de Lima Carlos on 08/06/21.
//  Copyright © 2021 Patricia Carlos. All rights reserved.
//

import UIKit
//MARK: - protocolos
protocol AdicionaRefeicaoDelegate {
    func add(_ refeicao: Refeicao)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionaItensDelegate {
    //MARK: - ATRIBUTOS
    var delegate: AdicionaRefeicaoDelegate?
    var itens: [Item] = [Item(nome: "Molho de Tomate", calorias: 40.0),
                         Item(nome: "Queijo", calorias: 40.0),
                         Item(nome: "Molho Apimentado", calorias: 40.0),
                         Item(nome: "Manjericão", calorias: 40.0)]
    var itensSelecionados: [Item] = []

    //MARK: - IBOutlets
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet weak var felicidadeTextField: UITextField?
    @IBOutlet weak var itensTableView: UITableView!
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        let botaoAdicionaItem = UIBarButtonItem(title: "adicionar", style: .plain, target: self, action: #selector(self.adicionarItens))
        navigationItem.rightBarButtonItem = botaoAdicionaItem
    }
    @objc func adicionarItens(){
        let adicionarItensViewController = AdicionarItensViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    func add(_ item: Item) {
        itens.append(item)
        itensTableView.reloadData()
    }
    
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let linhaDaTabela = indexPath.row
        let item = itens[linhaDaTabela]
        celula.textLabel?.text = item.nome
        return celula
    }
    
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let celula = tableView.cellForRow(at: indexPath) else { return }
        if celula.accessoryType == .none{
            celula.accessoryType = .checkmark
            let linhaDaTabela = indexPath.row
            itensSelecionados.append(itens[linhaDaTabela])
        }else{
            celula.accessoryType = .none
            let item = itens[indexPath.row]
            if let position = itensSelecionados.index(of: item){
                itensSelecionados.remove(at: position)
            }
        }
    }
    
    //MARK: - @IBAction
    @IBAction func adicionar(_ sender: Any) {
        guard let nomeDaRefeicao = nomeTextField?.text, let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else{ return }
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade, itens: itensSelecionados)
        refeicao.itens = itensSelecionados
        print("comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
        delegate?.add(refeicao)
        navigationController?.popViewController(animated: true)
    }
}
    
    




