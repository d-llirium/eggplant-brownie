//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Patricia de Lima Carlos on 08/06/21.
//  Copyright © 2021 Patricia Carlos. All rights reserved.
//

import UIKit
//MARK: - protocolos
//criando uma interface/protocolo com todas as definições de métodos que preciso usar
protocol AdicionaRefeicaoDelegate {
    func add(_ refeicao: Refeicao)
}
// classe ViewController controla a interface do usuário
    // implementa o protocolo  UITableView > UITableViewDataSource - métodos q armazena os dados da TableView
    // implementa o protocolo UITableView > UITableViewDelegate - métodos q correspondem as ações do usuário na tabela
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //MARK: - ATRIBUTOS
    var delegate: AdicionaRefeicaoDelegate?
    var itens: [String] = ["Molho de tomate","Queijo","Molho apimentado","Manjericão"]
    //MARK: - IBOutlets
    //@IBOutlet paa associar a variável a um campo
    //só vou saber o valor dessa variáveis no TEMPO de execução, por isso eu coloco um ! para forçar um valor, CUIDADO com o FORCE UNWRAPPING ! , pq pode dar crash
    //troca por optionals ? os ! forced unwrapp
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet weak var felicidadeTextField: UITextField?
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let linhaDaTabela = indexPath.row
        let item = itens[linhaDaTabela]
        celula.textLabel?.text = item
        return celula
    }
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let celula = tableView.cellForRow(at: indexPath) else { return }
        //para poder dar check e uncheck nos itens
        if celula.accessoryType == .none{
            celula.accessoryType = .checkmark
        }else{
            celula.accessoryType = .none
        }
    }
    //MARK: - @IBAction
    //mesmo nome do botão da interface
    @IBAction func adicionar(_ sender: Any) {
        //tratando os Outlets opcionais com guard let e convertendo a string felicidade em Int
        guard let nomeDaRefeicao = nomeTextField?.text, let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else{ return }
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade)
        print("comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
        //adiciona a refeião inserida na Lista
        delegate?.add(refeicao)
        //ele fecha a tela
        navigationController?.popViewController(animated: true)
    }
}
    /*
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
*/



