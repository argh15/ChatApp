//
//  ChatAppComposerViewModifider.swift
//  ChatApp
//
//  Created by Arghadeep Chakraborty on 9/16/24.
//

import SwiftUI

struct ChatAppComposerViewModifider: ViewModifier {

    public func body(content: Content) -> some View {
        content
            .background(.appBackground)
    }
}
