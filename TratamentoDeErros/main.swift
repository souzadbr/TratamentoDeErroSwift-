//
//  main.swift
//  TratamentoDeErros
//
//  Created by Debora.souza on 09/06/22.
//

import Foundation

//Tratamento de erro

//throws - palavrinha usada no tratamento de erro
//tratamento de erro é quando no seu cadigo caso algo de errado ou alguma coisa fora do esperadoa conteça. Voce nao quer que o programador simplismente receba uma informacao que ele nao espera ou ele nao saiba interpretar e o que deu errado e ela tenha a oportunidade de tratar esse erro, ou seja tomar alguma providencia com relacao a isso

/*
 func convert (value: String) -> [Int]? {
        ...
        ...
        if someProblem {
            return nil
        } else {
            return array
        }
 }
 retona nil quando tem algum problema
 
 let result = convert("Algo")
 print(result) //nil  ---> qual motivo de ter dado errado??
 
 */

enum LoginError: Error {
    case wrongLogin
    case wrongPassword
    case noInternetConnection
}

func login (userName: String, password: String) throws -> Bool {
    if checkInternetConnection() {
        if userName != "debora" {
            throw LoginError.wrongLogin
        }
        if password != "123456" {
            throw LoginError.wrongPassword
        }
            return true
        
        } else {
            throw LoginError.noInternetConnection
    }
    
}

func checkInternetConnection() -> Bool {
    return true
}

do{
    let loginResult = try login(userName: "debora", password: "123456")
} catch  LoginError.wrongLogin{
    print ("Nome do usuario invalido")
} catch LoginError.wrongPassword {
    print("Senha inválida")
} catch LoginError.noInternetConnection {
    print("Sem conexão com a internet!")
}

