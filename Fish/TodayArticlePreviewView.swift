//
//  TodayArticlePreviewView.swift
//  Fish
//
//  Created by Jia Chen Yee on 7/10/23.
//

import SwiftUI

struct TodayArticlePreviewView: View {
    
    var namespace: Namespace.ID
    
    var article: TodayArticle
    
    var action: (() -> Void)
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack(alignment: .bottom) {
                GeometryReader { geometry in
                    Image(.sampleToday)
                        .resizable()
                        .matchedGeometryEffect(id: "\(article.title)image", in: namespace)
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                }
                .aspectRatio(0.9, contentMode: .fit)
                .clipped()
                
                VStack(alignment: .leading) {
                    Text(article.subtitle)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundStyle(.secondary)
                    Text(article.title)
                        .font(.title)
                        .fontWeight(.bold)
                }
                .multilineTextAlignment(.leading)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.thickMaterial)
                .matchedGeometryEffect(id: "\(article.title)titlecard", in: namespace)
            }
            .aspectRatio(0.9, contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .foregroundStyle(.black)
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .shadow(radius: 16)
            }
        }
        .padding(.bottom)
    }
}
