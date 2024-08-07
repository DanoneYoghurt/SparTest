//
//  ContentView.swift
//  SparTest
//
//  Created by Антон Баскаков on 05.08.2024.
//

import SwiftUI

struct ContentView: View {
    @State var viewModel = ViewModel()
    
    @State private var listView = false
    @State private var showShoppingBag = false
    
    var body: some View {
        NavigationStack {
                    ScrollView {
                        if listView {
                            ForEach(viewModel.products.products, id: \.id) { product in
                                ProductListView(product: product, shoppingCart: $viewModel.shoppingCartItem)
                            }
                            
                        } else {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 110)), GridItem(.adaptive(minimum: 110))]) {
                                ForEach(viewModel.products.products, id: \.id) { product in
                                    ProductGridView(product: product, shoppingCart: $viewModel.shoppingCartItem)
                            }
                                
                    }
                            .padding(.horizontal)
                }
            }
                    .sheet(isPresented: $showShoppingBag) {
                        NavigationStack {
                            List {
                                ForEach(viewModel.shoppingCartItem, id: \.id) { product in
                                    ProductListView(product: product, shoppingCart: $viewModel.shoppingCartItem)
                                }
                                .onDelete(perform: viewModel.removeItems)
                            }
                            .listStyle(.plain)
                            .toolbar {
                                EditButton()
                            }
                        }
                    }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        listView.toggle()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 12.0)
                                .frame(width: 40, height: 40)
                                .foregroundStyle(Color.gray.opacity(0.2))
                            Image(systemName: listView ? "square.grid.2x2" : "rectangle.grid.1x2")
                                .fontWeight(.semibold)
                                .font(.system(size: 18))
                        }
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showShoppingBag.toggle()
                        print(viewModel.shoppingCartItem.description)
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 12.0)
                                .frame(width: 40, height: 40)
                                .foregroundStyle(Color.gray.opacity(0.2))
                            
                            Text("\(viewModel.shoppingCartItem.count)")
                                .fontWeight(.semibold)
                                .font(.system(size: 18))
                        }
                    }
                    
                }
            }
        }
    }

}

#Preview {
    ContentView()
}
