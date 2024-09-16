//
//  ChatAppChannelHeaderView.swift
//  ChatApp
//
//  Created by Arghadeep Chakraborty on 9/16/24.
//

import SwiftUI
import StreamChatSwiftUI
import StreamChat

struct ChatAppChannelHeaderView: ToolbarContent {
    
    @ObservedObject private var channelHeaderLoader = InjectedValues[\.utils].channelHeaderLoader
    
    @Injected(\.chatClient) var chatClient
    @Injected(\.utils) var utils
    @Injected(\.fonts) var fonts
    
    var channel: ChatChannel
    
    private var currentUserId: String {
        chatClient.currentUserId ?? ""
    }
    
    private var channelNamer: ChatChannelNamer {
        utils.channelNamer
    }
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .principal) {
            HStack(spacing: 12) {
                ChannelAvatarView(
                    channel: channel, showOnlineIndicator: false,
                    size: CGSize(width: 36, height: 36)
                )
                Text(channelNamer(channel, currentUserId) ?? "")
                    .font(fonts.bodyBold)
                    .foregroundStyle(.white)
                Spacer()
            }
        }
        ToolbarItem(placement: .topBarTrailing) {
            Button(action: {}, label: {
                Image(systemName: "ellipsis")
            })
        }
    }
}
