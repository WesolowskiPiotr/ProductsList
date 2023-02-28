//
//  String+Extension.swift
//  ProductsList
//
//  Created by Piotr Wesołowski on 27/02/2023.
//

import SwiftUI

extension String {
    static let empty = ""
    
    func load() -> UIImage {
        do {
            guard let url = URL(string: self) else {
                return UIImage(systemName: "photo")!
            }
            
            let data: Data = try Data(contentsOf: url)
            return UIImage(data: data) ?? UIImage(systemName: "photo")!
        } catch {
            
        }
        return UIImage()
    }
}
