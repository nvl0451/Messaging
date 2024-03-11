//
//  SearchField.swift
//  MessagingTest
//
//  Created by Андрей Королев on 11.03.2024.
//

import SwiftUI

// MARK: - SearchField является View для ввода запроса поиска, которое включает в себя кастомное поле ввода текста CustomSearchField с иконкой увеличительного стекла с левой стороны в режиме бездействия

struct SearchField: View {
    @State private var message = ""
    
    var body: some View {
        CustomSearchField(placeholder: Text("Поиск в Москве"), text: $message)
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(.mDarkGray)
        .clipShape(RoundedRectangle(cornerRadius: 13))
        .padding(.vertical)
        .padding(.leading, 8)
        .padding(.trailing, 8)
    }
}

#Preview {
    SearchField()
}

// MARK: - CustomSearchField является кастомным полем ввода текста, которое включает в себя иконку увеличительного стекла. Используется для запросов поиска

struct CustomSearchField: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool) -> () = {_ in}
    var commit: () -> () = {}
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                HStack {
                    Image.init(systemName: "magnifyingglass")
                        .foregroundStyle(.mGray)
                    
                    placeholder
                        .foregroundColor(.mGray)
                        .font(.custom("CeraPro-Regular", size: 15))
                }
                
            }
            
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
                .foregroundColor(.mGray)
                .font(.custom("CeraPro-Regular", size: 15))
        }
    }
}
