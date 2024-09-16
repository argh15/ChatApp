//
//  ChatAppChannelListItemView.swift
//  ChatApp
//
//  Created by Arghadeep Chakraborty on 9/14/24.
//

import SwiftUI

struct ChatAppChannelListItemView: View {
    
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
                    .font(.title3)
                    .foregroundStyle(.white)
                    .lineLimit(1)
                    .border(Color.pink)
                    .frame(maxWidth: .infinity, minHeight: 40, alignment: .bottomLeading)
                
                
                if hasUnreadMessage {
                    Text(lastMessage)
                        .foregroundStyle(.unreadMessageText)
                        .border(Color.pink)
                        .font(.subheadline)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(2)
                        .frame(maxWidth: .infinity, minHeight: 40, alignment: .topLeading)
                        .padding(.bottom, 4)
                } else {
                    Text(lastMessage)
                        .foregroundStyle(.messageText)
                        .border(Color.pink)
                        .font(.subheadline)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(2)
                        .frame(maxWidth: .infinity, minHeight: 40, alignment: .topLeading)
                        .padding(.bottom, 4)
                }
            }
        }
    }
}

#Preview {
    ChatAppChannelListItemView(channelName: "Bob", avatar: UIImage(named: "person")!, lastMessage: "This is my last message", hasUnreadMessage: true)
}
