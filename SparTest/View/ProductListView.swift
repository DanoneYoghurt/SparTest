//
//  ProductListView.swift
//  SparTest
//
//  Created by Антон Баскаков on 05.08.2024.
//

import SwiftUI

struct ProductListView: View {
    
    var product: Product
    
    @Binding var shoppingCart: [Product]
    
    var body: some View {
        ZStack {
            Color.white
            HStack {
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 168, height: 168)
                Spacer()
                HStack {
                    VStack(alignment: .leading) {
                        HStack(alignment: .top) {
                            VStack(alignment: .leading) {
                                HStack {
                                    RatingView(rating: product.rating)
                                    Rectangle()
                                        .frame(width: 1, height: 16)
                                        .foregroundStyle(.secondary)
                                    Text("\(product.reviews) отзывов")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                    
                                }
                                Text(product.name)
                                    .font(.caption)
                            }
                            Spacer()
                            VStack {
                                Image(systemName: product.listToBuy ? "list.clipboard.fill" : "list.bullet.clipboard")
                                    .foregroundStyle(product.listToBuy ? Color.accentColor : Color.secondary)
                                    .padding(2)
                                Divider()
                                Image(systemName: product.favorite ? "heart.fill" : "heart")
                                    .foregroundStyle(product.favorite ? Color.accentColor : Color.secondary)
                                    .padding(2)
                                
                            }
                            .background(Color.white.opacity(0.5))
                            .clipShape(.rect(cornerRadius: 16))
                            .frame(width: 32, height: 64)
                            .fontWeight(.semibold)
                            .padding(5)
                            
                        }
                        Spacer()
                        HStack {
                            VStack(alignment: .leading) {
                                Text("\(product.price.formatted()) Р/кг")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                
                                Text(product.oldPrice.formatted())
                                    .font(.caption)
                                    .strikethrough()
                                    .foregroundStyle(.secondary)
                            }
                            Spacer()
                            
                            Button {
                                // добавить в корзину
                                shoppingCart.append(product)
                                
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 40.0)
                                        .frame(width: 48, height: 36)
                                    Image(systemName: "bag")
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.white)
                                }
                            }
                        }
                    }
                }
                
                Spacer()
            }
            .padding()
            
        }

        .frame(maxWidth: .infinity, maxHeight: 176)
    }
    
}
    


#Preview {
    ZStack {
        Color.gray
            .ignoresSafeArea()
        ProductListView(product: Product(image: "exampleProductImage", price: 99.90, oldPrice: 199.90, rating: 4.1, reviews: 25, name: "Сосиски", favorite: false, listToBuy: false), shoppingCart: .constant([Product(image: "exampleProductImage", price: 99.90, oldPrice: 199.90, rating: 4.1, reviews: 25, name: "Сосиски", favorite: false, listToBuy: false)]))
    }
}
