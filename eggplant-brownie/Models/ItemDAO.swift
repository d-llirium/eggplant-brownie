//
//  ItemDAO.swift
//  eggplant-brownie
//
//  Created by user on 30/05/22.
//  Copyright © 2022 Patricia Carlos. All rights reserved.
//

import Foundation

class ItemDAO
{
    func save( _ itens: [ Item ] )
    {
        do {
            let dados = try NSKeyedArchiver.archivedData( // pega os itens e CODIFICA
                withRootObject: itens
                , requiringSecureCoding: false
            )
            guard let caminho = recuperaDiretorio() else { return } // pega o diretório
            try dados.write( to: caminho ) // adiciona esses itens atualizados e codificados ao diretório
        } catch {
            print( error.localizedDescription )
        }
    }
    func recupera() -> [ Item ]
    {
        do {
            guard let diretorio = recuperaDiretorio() else { return [] } // pega o diretório do itens
            let dados = try Data( contentsOf: diretorio ) // pega os dados que estão CODIFICADOS no diretório
            let itensSalvos = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData( // DECODIFICA os itens no diretório
                dados
            ) as! Array< Item > // transforma em uma Array
            return itensSalvos
        } catch {
            print( error.localizedDescription )
            return []
        }
    }
    
    func recuperaDiretorio() -> URL?
    {
        guard let diretorio = FileManager.default.urls(
            for: .documentDirectory
            , in: .userDomainMask
        ).first else { return nil}
        let caminho = diretorio.appendingPathComponent( "itens" )
        
        return caminho
    }

}
