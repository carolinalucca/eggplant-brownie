//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Carolina Lucca on 15/04/20.
//  Copyright © 2020 Carolina Lucca. All rights reserved.
//

import UIKit

class RefeicoesTableViewController: UITableViewController, AdicionaRefeicaoDelegate {
    
    // MARK: - Atributos
    
    var refeicoes = [Refeicao(nome: "Strogonoff", felicidade: 4),
                     Refeicao(nome: "Pizza", felicidade: 4),
                     Refeicao(nome: "Sorvete", felicidade: 5)]
    
    // MARK: - UITableViewDataSource
    
    // Numero de linhas de uma tabela - numberOfRows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    // Conteúdo de cada linha de uma tabela - cellForRow
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        celula.textLabel?.text = refeicoes[indexPath.row].nome
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(mostrarDetalhes))
        celula.addGestureRecognizer(longPress)
        
        return celula
    }
    
    // MARK: - Prepare
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "adicionar") {
            if let viewController = segue.destination as? ViewController {
                viewController.delegate = self
            }
        }
    }
    
    // MARK: - Funções
    
    func add(_ refeicao: Refeicao) {
        refeicoes.append(refeicao)
        tableView.reloadData()
    }
    
    @objc func mostrarDetalhes(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            
            // Pega refeiçao pressionada
            let celula = gesture.view as! UITableViewCell
            guard let indexPath = tableView.indexPath(for: celula) else { return }
            let refeicao = refeicoes[indexPath.row]
            
            // Criaçao da caixa de alerta com os detalhes da refeiçao
            let alerta = UIAlertController(title: refeicao.nome, message: refeicao.detalhes(), preferredStyle: .alert)
            let botaoCancelar = UIAlertAction(title: "ok", style: .cancel, handler: nil)
            
            // Adiciona o botao cancelar à caixa de alerta
            alerta.addAction(botaoCancelar)
            
            // Exibe a caixa de alerta ao pressionar uma refeiçao
            present(alerta, animated: true, completion: nil)
            
        }
    }
    
}
