//
//  TitleView.swift
//  Messaging
//
//  Created by Андрей Королев on 11.03.2024.
//

import SwiftUI

// MARK: - TitleView это заглавная панель экрана диалога с информацией о собеседнике - имя, фото, онлайн или нет

struct TitleView: View {
    var person: PersonModel
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        HStack (spacing: 20) {
            Button(action: { self.presentationMode.wrappedValue.dismiss() }) {
                Image(systemName: "arrow.left")
                    .resizable()
                    .frame(width: 25, height: 21, alignment: .leading)
                    .foregroundStyle(.mGreen)
                    .padding(10)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    //.padding(.leading)
            }
            
            
            VStack (alignment: .leading, spacing: 0) {
                Text(person.name)
                    .font(.custom("CeraPro-Regular", size: 15))
                    //.foregroundStyle(.black)
                
                HStack {
                    Image(systemName: "circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 6, height: 6)
                        .foregroundStyle(person.isOnline ? .mGreen : .black)
                    Text(person.isOnline ? "Сейчас онлайн" : "Не в сети")
                        .font(.custom("CeraPro-Regular", size: 13))
                    .foregroundStyle(.gray)
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
            
            
            
            AsyncImage(url: URL(string: person.imageUrl)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 42, height: 42, alignment: .trailing)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 10)
            } placeholder: {
                ProgressView()
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    TitleView(person: PersonModel(name: "Артем Ботвинов", imageUrl: "https://images.unsplash.com/photo-1590086782792-42dd2350140d?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", isOnline: true))
        .background(.mDarkGray)
}
