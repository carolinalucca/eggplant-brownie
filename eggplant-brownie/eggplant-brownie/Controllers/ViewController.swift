//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Carolina Lucca on 13/04/20.
//  Copyright © 2020 Carolina Lucca. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var felicidadeTextField: UITextField?

    @IBAction func adicionar(_ sender: Any) {
        
//        if let nomeDaRefeicao = nomeTextField?.text, let felicidadeDaRefeicao = felicidadeTextField?.text {
//
//            let nome = nomeDaRefeicao
//            if let felicidade = Int(felicidadeDaRefeicao) {
//                let refeicao = Refeicao(nome: nome, felicidade: felicidade)
//                print("comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
//            } else {
//                print("Erro ao tentar criar a refeição")
//            }
//
//        }
       
        guard let nomeDaRefeicao = nomeTextField?.text else {
            print("Erro ao validar nome")
            return
        }

        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else {
            print("Erro ao validar felicidade")
            return
        }

        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade)
        print("comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
        
        navigationController?.popViewController(animated: true)
        
    }
    
    
}

