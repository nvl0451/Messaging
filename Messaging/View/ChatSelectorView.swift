//
//  ChatSelectorView.swift
//  Messaging
//
//  Created by Андрей Королев on 11.03.2024.
//

import SwiftUI

// MARK: - ChatSelectorView это окно выбора диалога пользователя

struct ChatSelectorView: View {
    
    enum Tab: String, CaseIterable, Identifiable {
        case feed
        case contest
        case popular
        case shop
        
        var id: Self { self }
    }
    
    @State private var tab = Tab.shop
    
    
    var previewModels: [ChatPreviewModel]
    
    
    var body: some View {
        NavigationStack {
            TabView(selection: $tab) {
                Group {
                    
                    // MARK: - Следующие три экземпляра VStack не являются частью диалоговой системы и присутствуют лишь в форме dummy-объектов для корректного задействования TabBar
                    
                    VStack {
                        Color.mWhiteBG
                            .overlay {
                                Text("РАБОТА В ПРОГРЕССЕ")
                                    .font(.custom("CeraPro-Bold", size: 50))
                                    .foregroundStyle(.mLightGray2)
                            }
                    }
                    .tabItem {
                        Label("Лента", systemImage: "tray.2.fill")
                    }
                    .tag(Tab.feed)
                    
                    VStack {
                        Color.mWhiteBG
                            .overlay {
                                Text("РАБОТА В ПРОГРЕССЕ")
                                    .font(.custom("CeraPro-Bold", size: 50))
                                    .foregroundStyle(.mLightGray2)
                            }
                    }
                    .tabItem {
                        Label("Конкурсы", systemImage: "trophy.fill")
                    }
                    .tag(Tab.contest)
                    
                    VStack {
                        Color.mWhiteBG
                            .overlay {
                                Text("РАБОТА В ПРОГРЕССЕ")
                                    .font(.custom("CeraPro-Bold", size: 50))
                                    .foregroundStyle(.mLightGray2)
                            }
                    }
                    .tabItem {
                        Label("Годнота", systemImage: "hand.thumbsup.fill")
                    }
                    .tag(Tab.popular)
                    
                    // MARK: - Этот VStack является главной частью ChatSelectorView и отображает список доступных диалогов
                    
                    VStack {
                        HStack {
                            Image(systemName: "arrow.left")
                                .resizable()
                                .frame(width: 25, height: 21, alignment: .leading)
                                .foregroundStyle(.mGreen)
                                .padding(10)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .padding(.leading)
                            
                            Text("Сообщения")
                                .foregroundStyle(.mLightGray2)
                                .font(.custom("CeraPro-Bold", size: 30))
                        }.frame(maxWidth: .infinity, alignment: .leading)
                        
                        SearchField()
                        
                        ScrollView {
                            ForEach(previewModels) { model in
                                NavigationLink(destination: ChatView().navigationBarBackButtonHidden(true)) {
                                    ChatPreview(previewModel: model)
                                }
                            }
                        }.padding(.vertical, 20)
                            .padding(.horizontal, 20)
                    }
                    .background(.mWhiteBG)
                    .tabItem {
                        Label("Магазин", systemImage: "cart.fill")
                    }
                    .tag(Tab.shop)
                }
                .toolbarBackground(.mDarkGray, for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
            }
            .onAppear(perform: {
                
        })
        }
    }
}

#Preview {
    /*UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: "CeraPro-Regular", size: 15)! ], for: .normal) */
    
    ChatSelectorView(previewModels: {
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
    }())
}
