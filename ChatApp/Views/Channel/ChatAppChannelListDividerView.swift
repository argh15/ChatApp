//
//  ChatAppChannelListDividerView.swift
//  ChatApp
//
//  Created by Arghadeep Chakraborty on 9/15/24.
//

import SwiftUI

import SwiftUI

struct ChatAppChannelListDividerView: View {

    var body: some View {
        Rectangle()
            .fill(.divider)
            .frame(height: 1)
            .padding(.horizontal, 10)
            .blendMode(.screen)
    }
}

struct ChatAppChannelListDividerView_Previews: PreviewProvider {
    static var previews: some View {
        ChatAppChannelListDividerView()
    }
}
