//
//  ChatAppApp.swift
//  ChatApp
//
//  Created by Arghadeep Chakraborty on 9/14/24.
//

import SwiftUI
import StreamChat
import StreamChatSwiftUI

@main
struct SwiftUIChatDemoApp: App {
    
//    private let tokens = [
//        "Alice": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiYWxpY2UifQ.jIj1w4WSkclG-BcwHakinAOWiS2Ms9tFaR2ChP3SvIc",
//        "Bob": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiYm9iIn0.bDPl0osXodp9Ens6p0TE2YaEabMGYDT1QdGmzImoZqo"
//    ]
    // api key - x3wrespx5rdt
    
    var chatClient: ChatClient = {
        var config = ChatClientConfig(apiKey: .init("x3wrespx5rdt"))
        //8br4watad788

        let client = ChatClient(config: config)
        return client
    }()
    
    @State var streamChat: StreamChat?
    
    init() {
        streamChat = StreamChat(chatClient: chatClient)
        connectUser()
    }
    
    var body: some Scene {
        WindowGroup {
            ChatChannelListView(viewFactory: ChatAppViewFactory())
        }
    }
    
    private func connectUser() {
        let token = try! Token(rawValue: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiYWxpY2UifQ.jIj1w4WSkclG-BcwHakinAOWiS2Ms9tFaR2ChP3SvIc")
        
        chatClient.connectUser(
            
            userInfo: .init(
                id: "alice",
                name: "Alice",
                imageURL: URL(string: "https://avatar.iran.liara.run/public/53")!
            ),
            token: token
        ) { error in
            if let error = error {
                // Some very basic error handling only logging the error.
                log.error("connecting the user failed \(error)")
                return
            } else {
                print("Connected")
            }
        }
    }
}
