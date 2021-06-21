//
//  AdicionarItensViewController.swift
//  eggplant-brownie
//
//  Created by Patricia de Lima Carlos on 21/06/21.
//  Copyright © 2021 Patricia Carlos. All rights reserved.
//

import UIKit

class AdicionarItensViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var caloriasTextField: UITextField!
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - IBAction
    @IBAction func adicionarItem(_ sender: Any){
        guard let nome = nomeTextField.text, let calorias = caloriasTextField.text else {
            return
        }
        guard let numeroDeCalorias = Double(calorias) else {
            return
        }
        let item = Item(nome: nome,calorias: numeroDeCalorias)
        //navega  p proxima tela: navigationViewController.push()
        //volta para a tela anterior: navigationViewController.pop()
        
        navigationController?.popViewController(animated: true)
    }
}
