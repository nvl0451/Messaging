//
//  MessageModel.swift
//  Messaging
//
//  Created by Андрей Королев on 11.03.2024.
//

import Foundation

// MARK: - MessageModel включает в себя информацию о сообщении - его идентификатор, текстовое содержание, статус "отправлено или получено" и дату отправки

struct MessageModel {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}
