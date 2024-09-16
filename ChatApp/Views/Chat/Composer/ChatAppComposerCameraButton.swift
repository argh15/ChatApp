//
//  ChatAppComposerCameraButton.swift
//  ChatApp
//
//  Created by Arghadeep Chakraborty on 9/16/24.
//

import SwiftUI
import StreamChatSwiftUI

struct ChatAppComposerCameraButton: View {
    
    @Binding var pickerTypeState:PickerTypeState
    
    var body: some View {
        Button {
            withAnimation {
                pickerTypeState = .expanded(.media)
            }
        } label: {
            Image(systemName: "camera")
                .resizable()
                .scaledToFit()
                .frame(height: 20)
                .foregroundColor(.white)
        }
        .padding(.bottom, 8)
        .padding(.horizontal, 4)
    }
}
