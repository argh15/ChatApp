//
//  ChatAppComposerSendButton.swift
//  ChatApp
//
//  Created by Arghadeep Chakraborty on 9/16/24.
//

import SwiftUI

struct ChatAppComposerSendButton: View {
    let enabled: Bool
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            Image(systemName: "arrow.up")
                .resizable()
                .scaledToFit()
                .frame(width: 12, height: 12)
                .padding(10)
                .bold()
                .background(enabled ? .unreadDot : .messageTimestampText)
                .clipShape(Circle())
                .foregroundColor(.appBackground)
        }
        .padding(.bottom, 4)
        .disabled(!enabled)
    }
}
