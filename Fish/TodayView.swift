//
//  TodayView.swift
//  Fish
//
//  Created by Jia Chen Yee on 7/10/23.
//

import SwiftUI

struct TodayView: View {
    
    @Namespace var namespace
    
    @State private var selectedArticle: TodayArticle?
    
    var body: some View {
        NavigationStack {
            if let selectedArticle {
                ZStack(alignment: .topTrailing) {
                    ScrollView {
                        VStack(alignment: .leading) {
                            ZStack(alignment: .bottom) {
                                Image(.sampleToday)
                                    .resizable()
                                    .matchedGeometryEffect(id: "\(selectedArticle.title)image", in: namespace)
                                    .scaledToFit()
                                VStack(alignment: .leading) {
                                    Text(selectedArticle.subtitle)
                                        .font(.headline)
                                        .fontWeight(.bold)
                                        .foregroundStyle(.secondary)
                                    Text(selectedArticle.title)
                                        .font(.title)
                                        .fontWeight(.bold)
                                }
                                .multilineTextAlignment(.leading)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(.thickMaterial)
                                .matchedGeometryEffect(id: "\(selectedArticle.title)titlecard", in: namespace)
                            }
                            
                            ForEach(selectedArticle.content, id: \.description) { content in
                                if let title = content.title {
                                    Text(title)
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .padding(.bottom, -32)
                                }
                                Text(content.description)
                            }
                            .padding()
                        }
                        .padding(.bottom, 64)
                    }
                    .ignoresSafeArea(.container, edges: .top)
                    
                    Button {
                        withAnimation {
                            self.selectedArticle = nil
                        }
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 24))
                            .foregroundStyle(.white)
                    }
                    .padding()
                }
                .toolbar(.hidden)
            } else {
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("\(Date.now.formatted(date: .complete, time: .omitted))")
                            .fontWeight(.bold)
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                        
                        TodayArticlePreviewView(namespace: namespace, article: .sleep) {
                            withAnimation(.easeInOut) {
                                selectedArticle = .sleep
                            }
                        }
                        .padding(.horizontal)
                        
                        TodayArticlePreviewView(namespace: namespace, article: .jimmy) {
                            withAnimation(.easeInOut) {
                                selectedArticle = .jimmy
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .navigationTitle("Today")
            }
        }
    }
}

#Preview {
    TodayView()
}
