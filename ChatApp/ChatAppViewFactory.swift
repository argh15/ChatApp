//
//  ChatAppViewFactory.swift
//  ChatApp
//
//  Created by Arghadeep Chakraborty on 9/14/24.
//

import Foundation
import SwiftUI
import StreamChatSwiftUI
import StreamChat

class ChatAppViewFactory: ViewFactory {
    
    @Injected(\.chatClient) var chatClient: ChatClient
    
    func makeChannelListHeaderViewModifier(title: String) -> ChatAppHomeHeaderViewModifier {
        ChatAppHomeHeaderViewModifier(title: "Connections")
    }
    
    func makeChannelListItem(
        channel: ChatChannel,
        channelName: String,
        avatar: UIImage,
        onlineIndicatorShown: Bool,
        disabled: Bool,
        selectedChannel: Binding<ChannelSelectionInfo?>,
        swipedChannelId: Binding<String?>,
        channelDestination: @escaping (ChannelSelectionInfo) -> ChatChannelView<ChatAppViewFactory>,
        onItemTap: @escaping (ChatChannel) -> Void,
        trailingSwipeRightButtonTapped: @escaping (ChatChannel) -> Void,
        trailingSwipeLeftButtonTapped: @escaping (ChatChannel) -> Void,
        leadingSwipeButtonTapped: @escaping (ChatChannel) -> Void) -> some View {
            ChatAppChannelListItem(
                channel: channel,
                channelName: channelName,
                avatar: avatar,
                channelDestination: channelDestination,
                onItemTap: onItemTap,
                selectedChannel: selectedChannel)
        }
    
    func makeChannelListBackground(colors: ColorPalette) -> some View {
        Color(.appBackground)
            .edgesIgnoringSafeArea(.bottom)
    }
    
    func makeChannelListDividerItem() -> some View {
        ChatAppChannelListDividerView()
    }
    
    func makeChannelListTopView(searchText: Binding<String>) -> some View {
        EmptyView()
    }
}
