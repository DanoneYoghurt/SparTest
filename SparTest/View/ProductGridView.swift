//
//  ProductView.swift
//  SparTest
//
//  Created by Антон Баскаков on 05.08.2024.
//

import SwiftUI

struct ProductGridView: View {
    
    var product: Product
    
    @Binding var shoppingCart: [Product]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20.0)
                .foregroundStyle(.background)
            VStack {
                VStack {
                    ZStack {
                        Image(product.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 168, height: 168)
                        RatingView(rating: product.rating)
                            .offset(x: -55, y: 60)
                        
                        VStack {
                            HStack {
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
                        }
                    }
                    HStack {
                        Text(product.name)
                            .font(.caption)
                        Spacer()
                    }
                    .padding(.horizontal, 10)
                    
                    
                    Spacer()
                }
                
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
//                        Text(String(shoppingCart.count))
                    }
                }
                .padding(.horizontal, 10)
            }
            .padding(5)
        }
        .frame(width: 168, height: 278)
        .clipShape(.rect(cornerRadius: 25))
        .shadow(radius: 5)
        .padding(.vertical)
    }
}

#Preview {
    ZStack {
        Color.gray
            .ignoresSafeArea()
        ProductGridView(product: Product(image: "exampleProductImage", price: 99.90, oldPrice: 199.90, rating: 4.1, reviews: 25, name: "Сосиски", favorite: false, listToBuy: false), shoppingCart: .constant([Product(image: "exampleProductImage", price: 99.90, oldPrice: 199.90, rating: 4.1, reviews: 25, name: "Сосиски", favorite: false, listToBuy: false)]))
    }
}


