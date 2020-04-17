//
//  AdicionarItensViewController.swift
//  eggplant-brownie
//
//  Created by Carolina Lucca on 16/04/20.
//  Copyright © 2020 Carolina Lucca. All rights reserved.
//

import UIKit

protocol AdicionaItemDelegate {
    func add(_ item: Item)
}

class AdicionarItensViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var caloriasTextField: UITextField!
    
    // MARK: - Atributos
    
    var delegate: AdicionaItemDelegate?
    
    // MARK: - Init
    
    init(delegate: AdicionaItemDelegate) {
        super.init(nibName: "AdicionarItensViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    
    @IBAction func adicionaritem(_ sender: Any) {
        guard let nome = nomeTextField.text, let calorias = caloriasTextField.text else { return }
        guard let numeroDeCalorias = Double(calorias) else { return }
        
        let item = Item(nome: nome, calorias: numeroDeCalorias)
        delegate?.add(item)
        
        // voltar para tela anterior: navigationController.pop()
        navigationController?.popViewController(animated: true)
    }
    

}
