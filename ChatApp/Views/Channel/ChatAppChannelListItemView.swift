//
//  ChatAppChannelListItemView.swift
//  ChatApp
//
//  Created by Arghadeep Chakraborty on 9/14/24.
//

import SwiftUI
import StreamChatSwiftUI

struct ChatAppChannelListItemView: View {
    
    @Injected(\.fonts) var fonts
    
    let channelName: String
    let avatar: UIImage
    let lastMessage: String
    let hasUnreadMessage: Bool
    
    var body: some View {
        HStack {
            ZStack(alignment: .bottomLeading) {
                Image(uiImage: avatar)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                if hasUnreadMessage {
                    Circle()
                        .fill(.unreadDot)
                        .frame(width: 10, height: 10)
                        .offset(x: -5, y: -5)
                }
            }
            .padding()
            
            VStack(alignment: .leading, spacing: 4) {
                
                Spacer()
                
                Text(channelName)
                    .font(fonts.headline)
                    .foregroundStyle(.white)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, minHeight: 40, alignment: .bottomLeading)
                
                Text(lastMessage)
                    .foregroundStyle(hasUnreadMessage ? .unreadMessageText : .messageText)
                    .font(fonts.subheadline)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(2)
                    .frame(maxWidth: .infinity, minHeight: 40, alignment: .topLeading)
                    .padding(.bottom, 4)
            }
        }
    }
}

#Preview {
    ChatAppChannelListItemView(channelName: "Bob", avatar: UIImage(named: "person")!, lastMessage: "This is my last message", hasUnreadMessage: true)
}
