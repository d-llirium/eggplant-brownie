//
//  RefeicaoDAO.swift
//  eggplant-brownie
//
//  Created by user on 27/05/22.
//  Copyright © 2022 Patricia Carlos. All rights reserved.
//

import Foundation

class RefeicaoDAO
{
    func save( _ refeicoes: [ Refeicao ] )
    {
        guard let caminho = recuperaCaminho() else { return }
        
        do {
            let dados = try NSKeyedArchiver.archivedData( // tranforma em dados
                withRootObject: refeicoes
                , requiringSecureCoding: false
            )
            try dados.write( to: caminho ) // escreve
        } catch {
            print( error.localizedDescription )
        }
    }
    
    func recupera() -> [ Refeicao ]
    {
        guard let caminho = recuperaCaminho() else { return [] }
        do {
            let dados = try Data( contentsOf: caminho )
            guard let refeicoesSalvas = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData( // pega os dados para exibir
                dados
            ) as? Array< Refeicao > else { return [] } // as refeições
            
            return refeicoesSalvas
        } catch {
            print( error.localizedDescription )
        }
        return []
    }
    
    func recuperaCaminho() -> URL?
    {
        guard let diretorio = FileManager.default.urls(  // retorna o diretório do APP
            for: .documentDirectory
            , in: .userDomainMask
        ).first else { return nil }
        
        let caminho = diretorio.appendingPathComponent( // cria um arquivo no diretório
            "refeicao"
        )
        return caminho
    }
}
