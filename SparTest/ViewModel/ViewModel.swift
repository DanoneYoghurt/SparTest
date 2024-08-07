//
//  ViewModel.swift
//  SparTest
//
//  Created by Антон Баскаков on 05.08.2024.
//

import Foundation

@Observable
class ViewModel {
    var products = Products()
    var shoppingCartItem = [Product]()
    
    func removeItems(at offsets: IndexSet) {
        shoppingCartItem.remove(atOffsets: offsets)
    }
}
