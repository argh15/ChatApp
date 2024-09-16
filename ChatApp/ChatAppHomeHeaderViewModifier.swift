//
//  ChatAppHomeHeaderViewModifier.swift
//  ChatApp
//
//  Created by Arghadeep Chakraborty on 9/14/24.
//

import SwiftUI
import StreamChatSwiftUI

struct ChatAppHomeHeaderViewModifier: ChannelListHeaderViewModifier {
    
    var title: String
    
    func body(content: Content) -> some View {
        content.toolbar {
            ChatAppHomeHeaderView(title: title)
        }
        .background(.appBackground)
    }
    
}
