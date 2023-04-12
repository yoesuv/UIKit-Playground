//
//  CodableExtension.swift
//  My UI Kit Playground
//
//  Created by Yusuf Saifudin on 12/04/23.
//

import Foundation

extension Encodable {
    
    func encodeToString() throws -> String {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let data = try encoder.encode(self)
        let output = String(data: data, encoding: .utf8)
        return output ?? ""
    }
}
