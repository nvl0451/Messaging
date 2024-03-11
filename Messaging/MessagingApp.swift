//
//  MessagingApp.swift
//  Messaging
//
//  Created by Андрей Королев on 10.03.2024.
//

import SwiftUI

@main
struct MessagingApp: App {
    
    // MARK: - generatePreviewModels() создает dummy-модели чатов для их отображения в тестовом режиме
    
    var generatePreviewModels: [ChatPreviewModel] {
        var newPreviewModels: [ChatPreviewModel] = []
        
        for i in (0..<5) {
            let id = UUID()
            
            let person = PersonModel(
                name: (i % 2) == 0 ? "Артем Ботвинов" : "Анна Бондаревская",
                imageUrl: (i % 2) == 0 ? "https://images.unsplash.com/photo-1590086782792-42dd2350140d?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" : "https://images.unsplash.com/photo-1552699611-e2c208d5d9cf?q=80&w=2760&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                isOnline: (i % 3 == 0) ? true : false)
            
            let lastMessage = (i % 2) == 0 ? "Здравствуйте, за 10000 отдадите?" : "Да, все в наличии"
            
            let newMessage = (i % 2) != 0
            
            let date = "01.01"
            
            let previewModel = ChatPreviewModel(id: id, person: person, lastMessage: lastMessage, newMessage: newMessage, messageDate: date)
            
            newPreviewModels.append(previewModel)
        }
        
        return newPreviewModels
    }
    
    var body: some Scene {
        WindowGroup {
            ChatSelectorView(previewModels: generatePreviewModels)
        }
    }
}
