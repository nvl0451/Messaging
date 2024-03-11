//
//  ChatView.swift
//  Messaging
//
//  Created by Андрей Королев on 10.03.2024.
//

import SwiftUI

// MARK: - ChatView является окном переписки между двумя пользователями площадки

struct ChatView: View {
    
    var person: PersonModel = PersonModel(name: "Артем Ботвинов", imageUrl: "https://images.unsplash.com/photo-1590086782792-42dd2350140d?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", isOnline: true)
    
    var product: ProductModel = ProductModel(productName: "iPhone 11 64Gb", productPictureUrl: "https://www.casekidukaan.com/image/cache/catalog/cases/siliconemetal/13/Silicon%20case%20with%20metal%20buttons%20for%20iphone%2013%20series%20black-1600x1600.jpeg", productPrice: "45 000 ₽")
    
    var messages: [String] = ["Здравствуйте, за 10000 отдадите?", "Ни в коем случае", "У меня вообще то маленький ребенок есть", "Обмен не интересует"]
    
    
    var body: some View {
        VStack {
            //Color.mDarkGray
            Spacer()
            VStack(spacing: 0) {
                TitleView(person: person)
                    .background(.mDarkGray)
                    .cornerRadius(25, corners: [.bottomLeft, .bottomRight])
                    .padding(.top, 0)
                
                ScrollView {
                    
                    
                    
                    ProductShowcase(product: product)
                        .padding(.vertical, 80)
                    
                    Text("Сегодня")
                        .foregroundStyle(.gray)
                    
                    ForEach(0..<4) { num in
                        MessageBubble(message: MessageModel(id: "123", text: messages[num], received: (num % 2) == 0, timestamp: Date()))
                    }
                }
                
                MessageField()
                
                
            }
            .background(.mWhiteBG)
        }
        .background(.mDarkGray)
        
    }
}

#Preview {
    ChatView()
        //.background(.white)
}
