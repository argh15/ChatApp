//
//  ChatAppHomeHeaderView.swift
//  ChatApp
//
//  Created by Arghadeep Chakraborty on 9/14/24.
//

import SwiftUI

struct ChatAppHomeHeaderView: ToolbarContent {
    
    var title: String
    
    var body: some ToolbarContent {
        ToolbarItem(id: "Title", placement: .topBarLeading) {
            Text(title)
                .bold()
                .foregroundStyle(Color.white)
        }
    }
}
