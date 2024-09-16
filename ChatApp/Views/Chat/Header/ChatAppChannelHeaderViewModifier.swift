//
//  ChatAppChannelHeaderViewModifier.swift
//  ChatApp
//
//  Created by Arghadeep Chakraborty on 9/16/24.
//

import SwiftUI
import StreamChatSwiftUI
import StreamChat

struct ChatAppChannelHeaderViewModifier: ChatChannelHeaderViewModifier {
    
    let channel: ChatChannel
    
    func body(content: Content) -> some View {
        content.toolbar {
            ChatAppChannelHeaderView(channel: channel)
        }
        .toolbarBackground(.divider, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}
