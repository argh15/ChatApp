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
    @Injected(\.fonts) var fonts: Fonts
    
    func makeChannelListHeaderViewModifier(title: String) -> ChatAppHomeHeaderViewModifier {
        ChatAppHomeHeaderViewModifier(title: "Connections")
    }
    
    func makeChannelHeaderViewModifier(for channel: ChatChannel) -> some ChatChannelHeaderViewModifier {
        ChatAppChannelHeaderViewModifier(channel: channel)
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
    
    func makeMessageList(colors: ColorPalette) -> some View {
        Color(.appBackground)
            .edgesIgnoringSafeArea(.bottom)
    }
    
    func makeChannelListDividerItem() -> some View {
        ChatAppChannelListDividerView()
    }
    
    func makeChannelListTopView(searchText: Binding<String>) -> some View {
        EmptyView()
    }
    
    func makeComposerViewModifier() -> some ViewModifier {
        ChatAppComposerViewModifider()
    }
    
    func makeEmptyMessagesView(for channel: ChatChannel, colors: ColorPalette) -> some View {
        Text("This is the beginning of your conversation with \(getFriendName(channel: channel) ?? "your friend(s)").")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .multilineTextAlignment(.center)
            .padding()
            .background(.appBackground)
            .font(fonts.headline)
            .foregroundStyle(.messageText)
    }
    
    private func getFriendName(channel: ChatChannel) -> String? {
        guard let currentUserId = chatClient.currentUserId else { return nil }
        let members = channel.lastActiveMembers.filter { $0.id != currentUserId }
        return members.first?.name
    }
    
    func makeMessageTextView(for message: ChatMessage, isFirst: Bool, availableWidth: CGFloat, scrolledId: Binding<String?>) -> some View {
        ChatAppMessageTextView(message: message, isFirst: isFirst)
    }
    
    func makeMessageDateView(for message: ChatMessage) -> some View {
        EmptyView()
    }
    
    func makeMessageReadIndicatorView(channel: ChatChannel, message: ChatMessage) -> some View {
        EmptyView()
    }
    
    func makeScrollToBottomButton(unreadCount: Int, onScrollToBottom: @escaping () -> Void) -> some View {
        EmptyView()
    }
    
    func makeImageAttachmentView(for message: ChatMessage, isFirst: Bool, availableWidth: CGFloat, scrolledId: Binding<String?>) -> some View {
        ChatAppMessageImageView(message: message, width: availableWidth, isFirst: isFirst)
    }
    
    func makeTrailingComposerView(enabled: Bool, cooldownDuration: Int, onTap: @escaping () -> Void) -> some View {
        ChatAppComposerSendButton(enabled: enabled, onTap: onTap)
    }
    
    func makeLeadingComposerView(state: Binding<PickerTypeState>, channelConfig: ChannelConfig?) -> some View {
        ChatAppComposerCameraButton(pickerTypeState: state)
    }
    
}
