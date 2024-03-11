//
//  MessageBubble.swift
//  MessagingTest
//
//  Created by Андрей Королев on 10.03.2024.
//

import SwiftUI

// MARK: - MessageBubble это View сообщения, которая содержит в себе его текст и дату отправки, а также отображается слева или справа, серым или зеленым в зависимости от того, получено оно или отправлено (поле message.received)

struct MessageBubble: View {
    var message: MessageModel
    @State private var showTime = false
    
    var body: some View {
        VStack(alignment: message.received ? .leading : .trailing) {
            HStack(alignment: .bottom, spacing: 0) {
                Text(message.text)
                    .padding(.leading)
                    .padding(.vertical, 10)
                    .font(.custom("CeraPro-Regular", size: 15))
                    .if(message.received == false, transform: { view in
                        view.foregroundStyle(.white)
                    })
                    .frame(alignment: .leading)
                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .font(.custom("CeraPro-Regular", size: 13))
                    .foregroundStyle(message.received ? .mGray : .mGray2)
                    .padding(.trailing)
                    .padding(.leading, 5)
                    .padding(.bottom, 10)
            }
            .background(message.received ? .mDarkGray : .mGreen)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .frame(maxWidth: 300, alignment: message.received ? .leading : .trailing)
            
            
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: message.received ? .leading : .trailing)
        .padding(message.received ? .leading : .trailing)
        .padding(.horizontal, 10)
    }
}

#Preview {
    MessageBubble(message: MessageModel(id: "12345", text: "Привет, это тестовая версия сообщения для тестового приложения", received: true, timestamp: Date()))
        //.background(.gray)
}
