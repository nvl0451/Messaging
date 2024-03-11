//
//  ChatPreview.swift
//  Messaging
//
//  Created by Андрей Королев on 11.03.2024.
//

import SwiftUI

// MARK: - ChatPreview View отображается на экране списка диалогов (ChatSelectorView) по одной штуке на каждый диалог, начатый пользователем. Это поле дает пользователю быстрое представление о диалоге - Фото и Имя собеседника, в сети он или нет, последнее отправленное в диалог сообщение, дата последнего отправленного сообщения и индикатор непрочитанных сообщений

struct ChatPreview: View {
    var previewModel: ChatPreviewModel
    
    var person: PersonModel {
        return previewModel.person
    }
    var lastMessage: String {
        return previewModel.lastMessage
    }
    var newMessage: Bool {
        return previewModel.newMessage
    }
    var messageDate: String {
        return previewModel.messageDate
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            AsyncImage(url: URL(string: person.imageUrl)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 45, alignment: .trailing)
                    .clipShape(Circle())
                    .padding(.vertical, 10)
                    .padding(.trailing)
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading, spacing: 5) {
                HStack(spacing: 0) {
                    Image(systemName: "circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 6, height: 6)
                        .foregroundStyle(person.isOnline ? .mGreen : .black)
                        .padding(.trailing, 7)
                    
                    Text(person.name)
                        .font(.custom("CeraPro-Regular", size: 15))
                        .foregroundStyle(.mLightGray2)
                }
                
                Text(lastMessage)
                    .font(.custom("CeraPro-Regular", size: 15))
                    .foregroundStyle(.mGray)
                    .lineLimit(1)
            }.frame(alignment: .leading)
                .padding(.trailing)
            
            Spacer()
            
            VStack {
                Text(messageDate)
                    .font(.custom("CeraPro-Regular", size: 11))
                    .foregroundStyle(.mGray)
                //Spacer()
                Text((newMessage) ? "1" : "")
                    .font(.system(size: 15))
                    .foregroundStyle(.white)
                    .padding(.all, 8)
                    .background((newMessage) ? .mGreen : .clear)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 5)
        .background(.mDarkGray)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .frame(maxWidth: .infinity)
        
    }
}

#Preview {
    ChatPreview(previewModel: ChatPreviewModel(id: UUID(), person: PersonModel(name: "Артем Ботвинов", imageUrl: "https://images.unsplash.com/photo-1590086782792-42dd2350140d?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", isOnline: true), lastMessage: "Здравствуйте, за 10000 отдадите?", newMessage: true, messageDate: "01.01"))
}
