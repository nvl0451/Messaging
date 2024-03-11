//
//  PersonModel.swift
//  Messaging
//
//  Created by Андрей Королев on 11.03.2024.
//

import Foundation

// MARK: - PersonModel включает в себя имя, онлайн-статус и ссылку на аватар пользователя

struct PersonModel {
    var name: String
    var imageUrl: String
    var isOnline: Bool
}
