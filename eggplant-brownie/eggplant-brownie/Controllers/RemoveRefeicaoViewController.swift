//
//  RemoveRefeicaoViewController.swift
//  eggplant-brownie
//
//  Created by Carolina Lucca on 23/04/20.
//  Copyright © 2020 Carolina Lucca. All rights reserved.
//

import UIKit

class RemoveRefeicaoViewController {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func exibe(_ refeicao: Refeicao, handler: @escaping (UIAlertAction) -> Void) {
        
        // Criaçao da caixa de alerta com os detalhes da refeiçao
        let alerta = UIAlertController(title: refeicao.nome, message: refeicao.detalhes(), preferredStyle: .alert)
        let botaoCancelar = UIAlertAction(title: "cancelar", style: .cancel)
        let botaoRemover = UIAlertAction(title: "remover", style: .destructive,
            handler: handler)
        
        // Adiciona o botao cancelar à caixa de alerta
        alerta.addAction(botaoCancelar)
        alerta.addAction(botaoRemover)
        
        // Exibe a caixa de alerta ao pressionar uma refeiçao
        controller.present(alerta, animated: true, completion: nil)
        
    }
}
