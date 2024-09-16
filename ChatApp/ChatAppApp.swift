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

        let client = ChatClient(config: config)
        return client
    }()
    
    @State var streamChat: StreamChat?
    var appearance: Appearance?
    var utils: Utils?
    
    init() {
        setUtils()
        setAppearance()
        streamChat = StreamChat(chatClient: chatClient, appearance: appearance!, utils: utils!)
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
    
    private mutating func setAppearance() {
        var colors = ColorPalette()
        var fonts = Fonts()
        
        colors.tintColor = .white
        colors.text = .white
        colors.background = .appBackground
        colors.highlightedAccentBackground = .unreadDot
        colors.background1 = .appBackground
        colors.messageCurrentUserBackground = [.unreadDot]
        colors.messageOtherUserBackground = [.white]
        colors.messageCurrentUserTextColor = .appBackground
        colors.messageOtherUserTextColor = .appBackground
        
        fonts.body = .custom("Verdana", size: 14)
        fonts.bodyBold = .custom("Verdana-Bold", size: 14)
        fonts.headline = .custom("Verdana", size: 20)
        fonts.subheadline = .custom("Verdana", size: 14)
        fonts.footnote = .custom("Verdana", size: 10)
        
        appearance = Appearance(colors: colors, fonts: fonts)
    }
    
    private mutating func setUtils() {
        let messageListConfig = MessageListConfig(
            messagePopoverEnabled: false
        )
        utils = Utils(messageListConfig: messageListConfig)
    }
    
}
