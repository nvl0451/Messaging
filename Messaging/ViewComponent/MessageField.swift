//
//  MessageField.swift
//  MessagingTest
//
//  Created by Андрей Королев on 10.03.2024.
//

import SwiftUI

// MARK: - MessageField является View для ввода сообщения, которое включает в себя кнопку прикрепления файла, кастомное поле ввода текста CustomTextField и кнопку отправки текста

struct MessageField: View {
    @State private var message = ""
    
    var body: some View {
        
        HStack(spacing: 0) {
            Button {
                print("Adding file")
            } label: {
                Image(systemName: "paperclip")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .foregroundStyle(.mGray)
                    .padding(.leading, 10)
                    //.padding(10)
            }
            .padding(.leading)
            
            CustomTextField(placeholder: Text("Сообщение..."), text: $message)
            .padding(.horizontal)
            .padding(.vertical, 10)
            .background(.mDarkGray)
            .clipShape(RoundedRectangle(cornerRadius: 13))
            .padding(.vertical)
            .padding(.leading, 8)
            .padding(.trailing, 8)
            
            Button {
                print("Message sent")
                message = ""
            } label: {
                Image(systemName: "arrow.up")
                
                    .resizable()
                    .frame(width: 20, height: 25)
                    
                    .foregroundStyle(.white)
                    .padding(.horizontal, 9)
                    .padding(.vertical, 9)
                    .background(.mGreen)
                    .clipShape(Circle())
            }
            .padding(.trailing)
        }
        
    }
}

#Preview {
    MessageField()
        //.background(.black)
}

// MARK: - CustomTextField является кастомным полем для ввода текста

struct CustomTextField: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool) -> () = {_ in}
    var commit: () -> () = {}
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .foregroundColor(.mGray)
            }
            
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
}
