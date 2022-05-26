//
//  Alerta.swift
//  eggplant-brownie
//
//  Created by Patricia de Lima Carlos on 23/06/21.
//  Copyright © 2021 Patricia Carlos. All rights reserved.
//

import UIKit

class Alerta
{
    // MARK: - atributes
    let controller: UIViewController
    
    // MARK: - constructor
    init( controller: UIViewController ) {
        self.controller = controller
    }
    
    // MARK: - methods
    func exibe(
        titulo: String = "Atenção"
        , mensagem: String
    ){
        let alerta = UIAlertController(
            title: titulo
            , message: mensagem
            , preferredStyle: .alert
        )
        let ok = UIAlertAction(
            title: "Ok"
            , style: .cancel
            , handler: nil
        )
        alerta.addAction( ok )
        controller.present(
            alerta
            , animated: true
            , completion: nil
        )
    }
}
