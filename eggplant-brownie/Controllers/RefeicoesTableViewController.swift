//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Patricia de Lima Carlos on 16/06/21.
//  Copyright © 2021 Patricia Carlos. All rights reserved.
//

import UIKit

class RefeicoesTableViewController:
    UITableViewController
    , AdicionaRefeicaoDelegate
{
    //MARK: - atributes
    var refeicoes =
    [
        Refeicao(
            nome:"Macarrão"
            , felicidade: 4
        )
        , Refeicao(
            nome:"Pizza"
            , felicidade: 4
        )
        , Refeicao(
            nome:"Comida Japonesa"
            , felicidade: 5
        )
    ]
    
    // MARK: - methods
    override func viewDidLoad()
    {
        guard let caminho = recuperaCaminho() else { return }
        do {
            let dados = try Data( contentsOf: caminho )
            guard let refeicoesSalvas = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(
                dados
            ) as? Array< Refeicao > else { return }
            refeicoes = refeicoesSalvas
        } catch {
            print( error.localizedDescription )
        }
    }
}

// MARK: - UITableView Data Source and Delegate
extension RefeicoesTableViewController
{
    override func tableView(
        _ tableView: UITableView
        , numberOfRowsInSection section: Int
    ) -> Int {
        
        return refeicoes.count
    }
    
    override func tableView(
        _ tableView: UITableView
        , cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let celula = UITableViewCell(
            style: .default
            , reuseIdentifier: "refeicaoCell"
        )
        let refeicao = refeicoes[ indexPath.row ]
        celula.textLabel?.text = refeicao.nome
        
        let longPress = UILongPressGestureRecognizer(
            target: self
            , action: #selector(
                mostrarDetalhes(_: )
            )
        )
        celula.addGestureRecognizer( longPress )
        
        return celula
    }
}

// MARK: - RECUPERA
extension RefeicoesTableViewController
{
    func recuperaCaminho() -> URL?
    {
        guard let diretorio = FileManager.default.urls(
            for: .documentDirectory
            , in: .userDomainMask
        ).first else { return nil }
        let caminho = diretorio.appendingPathComponent(
            "refeicao"
        )
        print( caminho )
        
        return caminho
    }
}

// MARK: - ADD REF Delegate + SEGUE
extension RefeicoesTableViewController
{
    func add(_ refeicao: Refeicao) // só é chamada na View Controller
    {
        refeicoes.append( refeicao )
        tableView.reloadData()
        
        guard let caminho = recuperaCaminho() else { return }
        
        do {
            let dados = try NSKeyedArchiver.archivedData(
                withRootObject: refeicoes
                , requiringSecureCoding: false
            )
            try dados.write( to: caminho )
        } catch {
            print( error.localizedDescription )
        }
    }
    
    override func prepare(
        for segue: UIStoryboardSegue
        , sender: Any?
    ) {
        if segue.identifier == "adicionar"
        {
            if let viewController = segue.destination as? ViewController
            {
                viewController.delegate = self // passa o delegate para a prox tela
            }
        }
    }
}

    // MARK: - Remove Refeição AlertController
extension RefeicoesTableViewController
{
    @objc func mostrarDetalhes(
        _ gesture: UILongPressGestureRecognizer
    ) {
        if gesture.state == .began
        {
            let celula = gesture.view as! UITableViewCell
            guard let indexPath = tableView.indexPath(
                for: celula
            ) else { return }
            let refeicao = refeicoes[ indexPath.row ]
            
            RemoveRefeicaoViewController(
                controller: self
            ).exibe(
                refeicao
                , handler: { nomeandoUIAlertAction in
                self.refeicoes.remove( at: indexPath.row )
                self.tableView.reloadData()
                }
            )
        }
    }
}
