//
//  ChatView.swift
//  Fish
//
//  Created by Jia Chen Yee on 7/10/23.
//

import SwiftUI

struct ChatView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    @State private var newMessageContents = ""
    
    @FocusState private var isFieldFocused
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading) {
                    Text("Need Immediate Help?")
                        .font(.headline)
                    
                    Text("Contact the National Care Hotline at [1800-202-6868](tel:1800-202-6868).")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(.thickMaterial)
                
                List {
                    ForEach(viewModel.messages) { message in
                        VStack(alignment: .leading) {
                            HStack {
                                message.sender.image
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(.circle)
                                    .frame(height: 21)
                                Text(message.sender.description)
                                    .font(.caption)
                            }
                            Text(message.message)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 4)
                    }
                }
                .listStyle(.plain)
                
                HStack {
                    TextField("Message", text: $newMessageContents)
                        .focused($isFieldFocused)
                        .textFieldStyle(.roundedBorder)
                    
                    Button {
                        viewModel.sendMessage(newMessageContents)
                        newMessageContents = ""
                        isFieldFocused.toggle()
                    } label: {
                        Image(systemName: "paperplane.circle.fill")
                            .symbolRenderingMode(.multicolor)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 32)
                    }
                }
                .padding()
            }
            .navigationTitle("Ask Jimmy")
        }
    }
}

#Preview {
    ChatView()
}
