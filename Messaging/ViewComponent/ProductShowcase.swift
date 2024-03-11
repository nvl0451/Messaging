//
//  ProductShowcase.swift
//  Messaging
//
//  Created by Андрей Королев on 11.03.2024.
//

import SwiftUI

// MARK: - ProductShowcase View получает на вход ProductModel, состоящее из трех элементов - название, ценник и ссылка на фото продукта. ProductShowcase представляет этот продукт на экране диалога (ChatView) чтобы пользователь понимал, насчет какого продукта он сейчас торгуется

struct ProductShowcase: View {
    var product: ProductModel
    
    var body: some View {
        VStack {
            Text("Обсуждение товара")
                .foregroundStyle(.mGray)
                .font(.custom("CeraPro-Regular", size: 13))
            
            AsyncImage(url: URL(string: product.productPictureUrl)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 160.45, height: 160.45, alignment: .trailing)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            } placeholder: {
                ProgressView()
            }
            .padding(.vertical, 5)
            
            Text(product.productName)
                .foregroundStyle(.mGray)
                .font(.custom("CeraPro-Regular", size: 20))
            
            Text(product.productPrice)
                //.foregroundStyle(.white)
                .font(.custom("CeraPro-Bold", size: 24))
        }
    }
}

#Preview {
    ProductShowcase(product: ProductModel(productName: "iPhone 11 64Gb", productPictureUrl: "https://www.casekidukaan.com/image/cache/catalog/cases/siliconemetal/13/Silicon%20case%20with%20metal%20buttons%20for%20iphone%2013%20series%20black-1600x1600.jpeg", productPrice: "45 000 ₽"))
        .background(.mDarkGray)
}
