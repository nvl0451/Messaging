//
//  ChatPreviewModel.swift
//  Messaging
//
//  Created by Андрей Королев on 11.03.2024.
//

import Foundation

// MARK: - ChatPreviewModel это dummy-модель для отображения несуществующего чата в списке чатов. Эта модель включает в себя идентификатор чата, модель собеседника, текст последнего сообщения, переключатель наличия новых сообщений и дату отправки последнего сообщения в данный диалог

struct ChatPreviewModel: Identifiable {
    var id: UUID
    
    var person: PersonModel
    var lastMessage: String
    var newMessage: Bool
    var messageDate: String
}
