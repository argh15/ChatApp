//
//  ChatAppChannelListItem.swift
//  ChatApp
//
//  Created by Arghadeep Chakraborty on 9/15/24.
//

import SwiftUI
import StreamChat
import StreamChatSwiftUI

struct ChatAppChannelListItem: View {
    
    let channel: ChatChannel
    let channelName: String
    let avatar: UIImage
    let channelDestination: (ChannelSelectionInfo) -> ChatChannelView<ChatAppViewFactory>
    let onItemTap: (ChatChannel) -> Void
    @Binding var selectedChannel: ChannelSelectionInfo?
    
    var body: some View {
        ZStack {
            ChatAppChannelListItemView(
                channelName: channelName,
                avatar: avatar,
                lastMessage: channel.latestMessages.first?.text ?? "Send a message and embark on a journey of discovery together.",
                hasUnreadMessage: channel.unreadCount.messages > 0)
            .padding(.trailing)
            .contentShape(Rectangle())
        }
        .onTapGesture {
            onItemTap(channel)
        }
        NavigationLink(tag: channel.channelSelectionInfo, selection: $selectedChannel) {
            channelDestination(channel.channelSelectionInfo)
        } label: {
            EmptyView()
        }
    }
}
