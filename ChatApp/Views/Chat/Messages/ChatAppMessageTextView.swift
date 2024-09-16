//
//  ChatAppMessageTextView.swift
//  ChatApp
//
//  Created by Arghadeep Chakraborty on 9/16/24.
//

import SwiftUI
import StreamChatSwiftUI
import StreamChat

struct ChatAppMessageTextView: View {
    @Injected(\.colors) var colors
    @Injected(\.fonts) var fonts
    
    var message: ChatMessage
    var isFirst: Bool
    
    public var body: some View {
        VStack {
            Text(message.text)
                .padding([.top, .leading, .trailing], 12)
                .padding(.bottom, 24)
                .frame(minWidth: 100, alignment: .leading)
                .messageBubble(for: message, isFirst: isFirst, cornerRadius: 14)
                .font(fonts.body)
                .overlay(
                    BottomRightView {
                        Text(getTimestamp(date: message.createdAt))
                            .font(fonts.footnote)
                            .foregroundColor(.messageTimestampText)
                            .padding(6)
                    }
                )
        }
    }
    
    private func getTimestamp(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter.string(from: date)
    }
}
