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
//controla a interface do usuário
class ViewController: UIViewController {
    //MARK: - ATRIBUTOS
    var delegate: AdicionaRefeicaoDelegate?
    //MARK: - IBOutlets
    //@IBOutlet paa associar a variável a um campo
    //só vou saber o valor dessa variáveis no TEMPO de execução, por isso eu coloco um ! para forçar um valor, CUIDADO com o FORCE UNWRAPPING ! , pq pode dar crash
    //troca por optionals ? os ! forced unwrapp
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet weak var felicidadeTextField: UITextField?
    
    //MARK: - @IBAction
    //mesmo nome do botão da interface
    @IBAction func adicionar(_ sender: Any) {
        //tratando os Outlets opcionais com guard let e convertendo a string felicidade em Int
        guard let nomeDaRefeicao = nomeTextField?.text, let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else{
            return
        }
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



