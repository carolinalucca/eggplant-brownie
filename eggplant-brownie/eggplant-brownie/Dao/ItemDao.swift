//
//  ItemDao.swift
//  eggplant-brownie
//
//  Created by Carolina Lucca on 23/04/20.
//  Copyright © 2020 Carolina Lucca. All rights reserved.
//

import Foundation

class ItemDao {
    
    func save(_ listaDeItens: Array<Item>) {
        do {
            let dados = try NSKeyedArchiver.archivedData(withRootObject: listaDeItens, requiringSecureCoding: false)
            guard let caminho = recuperarDiretorio() else { return }
            try dados.write(to: caminho)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func recuperarDiretorio() -> URL? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let caminho = diretorio.appendingPathComponent("itens")
        
        return caminho
    }
    
    func recupera() -> Array<Item> {
        do {
            guard let caminho = recuperarDiretorio() else { return [] }
            let dados = try Data(contentsOf: caminho)
            let itensSalvos = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as! Array<Item>
            return itensSalvos
        } catch {
            print(error.localizedDescription)
            return []
        }
        
    }
    
    
    
}
