//
//  ProductModel.swift
//  SparTest
//
//  Created by Антон Баскаков on 05.08.2024.
//

import Foundation

class Products {
    var products = [
        Product(image: "example1", price: 99.90, oldPrice: 199.90, rating: 4.1, reviews: 33, name: "сыр Ламбер 500/0 230г", favorite: false, listToBuy: false),
        Product(image: "example2", price: 95699.90, oldPrice: 199.90, rating: 4.3, reviews: 4, name: "Энергетический Напиток AdrenaIine Rush 0,449л ж/б", favorite: false, listToBuy: false),
        Product(image: "example3", price: 250.90, oldPrice: 199.90, rating: 2.1, reviews: 55, name: "Салат Овощной с Крабовыми Палочками", favorite: false, listToBuy: false),
        Product(image: "example4", price: 367.90, oldPrice: 199.90, rating: 1.1, reviews: 16, name: "Дорадо Охлажденная Непотрошеная 300-400г", favorite: true, listToBuy: false),
        Product(image: "example5", price: 1298.90, oldPrice: 199.90, rating: 4.9, reviews: 5, name: "Ролл Маленькая Япония 216г", favorite: false, listToBuy: true),
        Product(image: "example6", price: 120.90, oldPrice: 199.90, rating: 5.0, reviews: 19, name: "Огурцы тепличные cадово-огородные", favorite: true, listToBuy: true),
        Product(image: "example7", price: 1298.90, oldPrice: 199.90, rating: 3.1, reviews: 1, name: "Манго Кео", favorite: false, listToBuy: false),
        Product(image: "example8", price: 2600.90, oldPrice: 199.90, rating: 2.3, reviews: 7, name: "Масло Слобода Рафинированное 1,8л", favorite: true, listToBuy: false)
    ]
}

struct Product: Identifiable, Codable {
    var id = UUID()
    var image: String
    var price: Double
    var oldPrice: Double
    var rating: Double
    var reviews: Int
    var name: String
    var favorite: Bool
    var listToBuy: Bool
}


