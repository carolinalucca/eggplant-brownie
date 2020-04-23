//
//  RefeicaoDao.swift
//  eggplant-brownie
//
//  Created by Carolina Lucca on 23/04/20.
//  Copyright © 2020 Carolina Lucca. All rights reserved.
//

import Foundation

class RefeicaoDao {
    
    func save(_ refeicoes: Array<Refeicao>) {
        
        guard let caminho = recuperarDiretorio() else { return }
        
        do {
            let dados = try NSKeyedArchiver.archivedData(withRootObject: refeicoes, requiringSecureCoding: false)
            try dados.write(to: caminho)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func recuperarDiretorio() -> URL? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let caminho = diretorio.appendingPathComponent("refeicao")
        
        return caminho
    }
    
    func recupera() -> Array<Refeicao> {
        guard let caminho = recuperarDiretorio() else { return [] }
        
        do {
            let dados = try Data(contentsOf: caminho)
            guard let refeicoesSalvas = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as? Array<Refeicao> else { return [] }
            return refeicoesSalvas
        } catch {
            print(error.localizedDescription)
            return []
        }
        
    }
}
