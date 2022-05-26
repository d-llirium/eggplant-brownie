//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Patricia de Lima Carlos on 08/06/21.
//  Copyright © 2021 Patricia Carlos. All rights reserved.
//

import UIKit
//MARK: - protocolos
protocol AdicionaRefeicaoDelegate
{
    func add(_ refeicao: Refeicao)
}

class ViewController: UIViewController
                    , UITableViewDataSource
                    , UITableViewDelegate
                    , AdicionaItensDelegate
{
    //MARK: - atributes
    var delegate: AdicionaRefeicaoDelegate?
    var itens: [ Item ] =
    [
        Item(
            nome: "Molho de Tomate"
            , calorias: 40.0
        )
        , Item(
            nome: "Queijo"
            , calorias: 40.0
        )
        , Item(
            nome: "Molho Apimentado"
            , calorias: 40.0
        )
        , Item(
            nome: "Manjericão"
            , calorias: 40.0
        )
    ]
    var itensSelecionados: [ Item ] = []

    //MARK: - IBOutlets
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet weak var felicidadeTextField: UITextField?
    @IBOutlet weak var itensTableView: UITableView?
    
    //MARK: - View life cycle
    override func viewDidLoad()
    {
        let botaoAdicionaItem = UIBarButtonItem(
            title: "+ intem"
            , style: .plain
            , target: self
            , action: #selector( self.adicionarItens )
        )
        navigationItem.rightBarButtonItem = botaoAdicionaItem
        
        do {
            guard let diretorio = recuperaDiretorio() else { return }
            let dados = try Data( contentsOf: diretorio )
            let itensSalvos = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(
                dados
            ) as! Array< Item >
            itens = itensSalvos
        } catch {
            print( error.localizedDescription )
        }
    }
    
    //MARK: - @IBAction
    @IBAction func adicionar( _ sender: Any )
    {
        guard let refeicao = recuperaRefeicaoDoFormulario() else {
            Alerta(
                controller: self
            ).exibe(
                mensagem: "Erro ao ler dados do fomulário"
            )
            return
        }
        delegate?.add( refeicao )
        navigationController?.popViewController( animated: true )
    }
}
    
// MARK: - UITableView DataSource and Delegate
extension ViewController
{
    //MARK: - UITableViewDataSource
    func tableView(
        _ tableView: UITableView
        , numberOfRowsInSection section: Int
    ) -> Int {
        
        return itens.count
    }
    
    func tableView(
        _ tableView: UITableView
        , cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let celula = UITableViewCell(
            style: .default
            , reuseIdentifier: "celula"
        )
        let linhaDaTabela = indexPath.row
        let item = itens[ linhaDaTabela ]
        celula.textLabel?.text = item.nome
        
        return celula
    }
    
    //MARK: - UITableViewDelegate
    func tableView(
        _ tableView: UITableView
        , didSelectRowAt indexPath: IndexPath
    ) {
        guard let celula = tableView.cellForRow( at: indexPath ) else { return }
        if celula.accessoryType == .none
        {
            celula.accessoryType = .checkmark
            let linhaDaTabela = indexPath.row
            itensSelecionados.append(
                itens[
                    linhaDaTabela
                ]
            )
        } else {
            celula.accessoryType = .none
            let item = itens[ indexPath.row ]
            if let position = itensSelecionados.firstIndex( of: item )
            {
                itensSelecionados.remove( at: position )
            }
        }
    }
}

// MARK: -  Recupera
extension ViewController
{
    func recuperaDiretorio() -> URL?
    {
        guard let diretorio = FileManager.default.urls(
            for: .documentDirectory
            , in: .userDomainMask
        ).first else { return nil}
        let caminho = diretorio.appendingPathComponent( "itens" )
        
        return caminho
    }
    
    func recuperaRefeicaoDoFormulario() -> Refeicao?
    {
        guard let nomeDaRefeicao = nomeTextField?.text else { return nil }
        guard let felicidadeDaRefeicao = felicidadeTextField?.text
            , let felicidade = Int( felicidadeDaRefeicao ) else { return nil }
        let refeicao = Refeicao(
            nome: nomeDaRefeicao
            , felicidade: felicidade
            , itens: itensSelecionados
        )
        
        return refeicao
    }
}


// MARK: - ADD ITEM
extension ViewController
{
    @objc func adicionarItens()
    {
        let adicionarItensViewController = AdicionarItensViewController(
            delegate: self
        )
        navigationController?.pushViewController(
            adicionarItensViewController
            , animated: true
        )
    }
    
    func add( _ item: Item )
    {
        itens.append( item )
        if let tableView = itensTableView
        {
            tableView.reloadData()
        } else {
            Alerta(
                controller: self
            ).exibe(
                mensagem: "Não foi possível atualizar a tabela"
            )
        }
        do {
            let dados = try NSKeyedArchiver.archivedData(
                withRootObject: itens
                , requiringSecureCoding: false
            )
            guard let caminho = recuperaDiretorio() else { return }
            try dados.write( to: caminho )
        } catch {
            print( error.localizedDescription )
        }
    }
}

