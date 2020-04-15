//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Carolina Lucca on 15/04/20.
//  Copyright © 2020 Carolina Lucca. All rights reserved.
//

import UIKit

class RefeicoesTableViewController: UITableViewController {
    
    let refeicoes = [Refeicao(nome: "Strogonoff", felicidade: 4),
                     Refeicao(nome: "Pizza", felicidade: 4),
                     Refeicao(nome: "Sorvete", felicidade: 5)]
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        celula.textLabel?.text = refeicoes[indexPath.row].nome
        
        return celula
    }
    
}