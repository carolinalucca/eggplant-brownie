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
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        
        guard let caminho = recuperarDiretorio() else { return }
        
        do {
            let dados = try Data(contentsOf: caminho)
            let refeicoesSalvas = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as! Array<Refeicao>
            refeicoes = refeicoesSalvas
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func recuperarDiretorio() -> URL? {
       guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
       let caminho = diretorio.appendingPathComponent("refeicao")
       
       return caminho
   }
    
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
        
        guard let caminho = recuperarDiretorio() else { return }
        
        do {
            let dados = try NSKeyedArchiver.archivedData(withRootObject: refeicoes, requiringSecureCoding: false)
            try dados.write(to: caminho)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    @objc func mostrarDetalhes(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            
            // Pega refeiçao pressionada
            let celula = gesture.view as! UITableViewCell
            guard let indexPath = tableView.indexPath(for: celula) else { return }
            let refeicao = refeicoes[indexPath.row]
            
            RemoveRefeicaoViewController(controller: self).exibe(refeicao,
                handler: { alerta in
                            self.refeicoes.remove(at: indexPath.row)
                            self.tableView.reloadData()
                        })
        }
    }
    
}
