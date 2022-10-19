//
//  GetExcuse.swift
//  ExcuseApp
//
//  Created by Yara Vitoria on 18/10/22.
//

import Foundation
import UIKit
class GetService {
    static func getExcuses() async throws -> [ExcuseModel] {
        do {
// eu coloco em uma variavel os dados que eu pego da API a partir da URL colocada
        let (excuseRequest, _) = try await URLSession.shared.data(from: URL(string: "https://excuser.herokuapp.com/v1/excuse/100")!)
            let jsonResult = try JSONDecoder().decode([ExcuseModel].self, from: excuseRequest)
//            print(jsonResult[0].excuse)
            // acesso ao primeiro array
            return jsonResult
        } catch {
            print(error)
            throw error
        }
    }
}
