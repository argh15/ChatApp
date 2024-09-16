//
//  ChatAppHomeHeaderView.swift
//  ChatApp
//
//  Created by Arghadeep Chakraborty on 9/14/24.
//

import SwiftUI
import StreamChatSwiftUI

struct ChatAppHomeHeaderView: ToolbarContent {
    
    var title: String
    @Injected(\.fonts) var fonts
    
    var body: some ToolbarContent {
        ToolbarItem(id: "Title", placement: .topBarLeading) {
            Text(title)
                .bold()
                .foregroundStyle(Color.white)
                .font(fonts.headline)
        }
    }


}
