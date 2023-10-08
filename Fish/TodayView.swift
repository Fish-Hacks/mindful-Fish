//
//  TodayView.swift
//  Fish
//
//  Created by Jia Chen Yee on 7/10/23.
//

import SwiftUI

struct TodayView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    @Namespace var namespace
    
    @State private var selectedArticle: TodayArticle?
    
    var body: some View {
        NavigationStack {
            if let selectedArticle {
                ZStack(alignment: .topTrailing) {
                    ScrollView {
                        VStack(alignment: .leading) {
                            ZStack(alignment: .bottom) {
                                selectedArticle.image
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
                            .background {
                                Circle()
                                    .fill(.blue)
                            }
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
                        
                        VStack {
                            HStack(spacing: 0) {
                                Text(viewModel.brineShrimp <= 100 ? "Location 1" : "Location 2")
                                    .font(.headline)
                                    .foregroundStyle(.secondary)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Image(systemName: "bolt.fill")
                                    .foregroundStyle(.secondary)
                                    .padding(.trailing, 4)
                                
                                Text("\(viewModel.brineShrimp % 100)/100")
                                    .monospacedDigit()
                                    .contentTransition(.numericText())
                                    .font(.headline)
                                    .foregroundStyle(.secondary)
                            }
                            
                            Text(viewModel.brineShrimp <= 100 ? "Coral Reef" : "Deep Sea")
                                .font(.title)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .fontWeight(.bold)
                            
                            GeometryReader { geometry in
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(.secondary)
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundStyle(.blue)
                                    .frame(width: min(geometry.size.width * (Double(viewModel.brineShrimp % 100) / 100), geometry.size.width))
                            }
                            .frame(height: 16)
                        }
                        .padding()
                        .background(.thickMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .padding()
                        
                        TodayArticlePreviewView(namespace: namespace, article: .jimmy) {
                            withAnimation(.easeInOut) {
                                selectedArticle = .jimmy
                            }
                        }
                        .padding(.horizontal)
                        
                        TodayArticlePreviewView(namespace: namespace, article: .sleep) {
                            withAnimation(.easeInOut) {
                                selectedArticle = .sleep
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
