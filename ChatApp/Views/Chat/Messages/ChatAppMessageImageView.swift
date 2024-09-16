//
//  ChatAppMessageImageView.swift
//  ChatApp
//
//  Created by Arghadeep Chakraborty on 9/16/24.
//

import SwiftUI
import StreamChatSwiftUI
import StreamChat

struct ChatAppMessageImageView: View {
    @Injected(\.colors) var colors
    @Injected(\.fonts) var fonts
    
    var message: ChatMessage
    var width: CGFloat
    var isFirst: Bool
    
    public var body: some View {
        VStack(alignment: .leading) {
            if let attachment = message.imageAttachments.first {
                let imageURL = attachment.imageURL
                
                AsyncImage(url: imageURL) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: width - 50)
                            .cornerRadius(14)
                    case .failure:
                        Image(systemName: "xmark.octagon")
                            .foregroundColor(.red)
                    @unknown default:
                        EmptyView()
                    }
                }
                .padding([.leading, .trailing, .top], 12)
            }
            
            if !message.text.isEmpty {
                Text(message.text)
                    .padding(.top, 2)
                    .padding([.leading, .trailing], 12)
                    .font(fonts.body)
            }
    
            Text(getTimestamp(date: message.createdAt))
                .font(fonts.footnote)
                .foregroundColor(.messageTimestampText)
                .padding([.trailing, .bottom], 6)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .messageBubble(for: message, isFirst: isFirst, cornerRadius: 14)
    }
    
    private func getTimestamp(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter.string(from: date)
    }
}

