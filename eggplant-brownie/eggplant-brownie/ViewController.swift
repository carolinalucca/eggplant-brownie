//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Carolina Lucca on 13/04/20.
//  Copyright © 2020 Carolina Lucca. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nomeTextField: UITextField!
    @IBOutlet var felicidadeTextField: UITextField!

    @IBAction func adicionar(_ sender: Any) {
        let nome = nomeTextField.text
        let felicidade = felicidadeTextField.text
        print("comi \(nome) e fiquei com felicidade: \(felicidade)")
    }
    
    
}

