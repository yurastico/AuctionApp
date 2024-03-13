//
//  AvaliadorTests.swift
//  LeilaoTests
//
//  Created by Yuri Cunha on 13/03/24.
//  Copyright © 2024 Alura. All rights reserved.
//

import XCTest
@testable import Leilao
final class AvaliadorTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testDeveEntenderLancesEmOrdemCrescene() {
        // Cenario
        
        let joao = Usuario(nome: "Joao")
        let jose = Usuario(nome: "Jose")
        let maria = Usuario(nome: "Maria")
        
        let leilao = Leilao(descricao: "Playstation 4")
        leilao.propoe(lance: Lance(maria, 250.0))
        leilao.propoe(lance: Lance(joao, 300.0))
        leilao.propoe(lance: Lance(jose, 400.0))
        
        // Acao
        
        let leiloeiro = Avaliador()
        leiloeiro.avalia(leilao: leilao)
        
        // Validacao
        
        
        XCTAssertEqual(250.0, leiloeiro.menorLance())
        XCTAssertEqual(400.0, leiloeiro.maiorLance())
        
    }
    
    func testDeveEntenderLeilaoComApenasUmLance() {
        let joao = Usuario(nome: "joao")
        let leilao = Leilao(descricao: "playstation")
        leilao.propoe(lance: Lance(joao, 1000.0))
        
        let leiloeiro = Avaliador()
        leiloeiro.avalia(leilao: leilao)
        
        XCTAssertEqual(1000.0, leiloeiro.menorLance())
        XCTAssertEqual(1000.0, leiloeiro.maiorLance())
    }
    
    func testDeveEncontrarOsTresMaioresLances() {
        let joao = Usuario(nome: "Joao")
               let maria = Usuario(nome: "Maria")
               
               let leilao = Leilao(descricao: "Playstation 4")
               leilao.propoe(lance: Lance(joao, 300.0))
               leilao.propoe(lance: Lance(maria, 400.0))
               leilao.propoe(lance: Lance(joao, 500.0))
               leilao.propoe(lance: Lance(maria, 600.0))
               
               let leiloeiro = Avaliador()
               leiloeiro.avalia(leilao: leilao)
               
               let listaLances = leiloeiro.tresMaiores()
               
               XCTAssertEqual(3, listaLances.count)
               XCTAssertEqual(600.0, listaLances[0].valor)
               XCTAssertEqual(500.0, listaLances[1].valor)
               XCTAssertEqual(400.0, listaLances[2].valor)

    }
    
    
    
}
