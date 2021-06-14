//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Patricia de Lima Carlos on 08/06/21.
//  Copyright © 2021 Patricia Carlos. All rights reserved.
//

import UIKit
//controla a interface do usuário
class ViewController: UIViewController {
//MARK: - declarar variávies
    //@IBOutlet paa associar a variável a um campo
    //só vou saber o valor dessa variáveis no TEMPO de execução, por isso eu coloco um ! para forçar um valor, CUIDADO com o FORCE UNWRAPPING ! , pq pode dar crash
    @IBOutlet var nomeTextField: UITextField!
    @IBOutlet weak var felicidadeTextField: UITextField!
    //MARK: - métodos
    //mesmo nome do botão da interface
    //MARK: - @IBAction
    @IBAction func adicionar(_ sender: Any) {
        //.text para ler o texto
        let nome = nomeTextField.text
        let felicidade = felicidadeTextField.text
        print("comi \(nome) e fiquei com felicidade: \(felicidade)")
    }
}
    /*
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
*/



