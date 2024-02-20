//
//  DetailView.swift
//  The New York Times
//
//  Created by Santos Ramon on 19/02/24.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let article: Result
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    titleView
                    abstractView
                    articleImage(media: article.media)
                    metadataView
                }
                .padding(.top, 10)
            }
            .preferredColorScheme(.dark)
        }
    }
    
    private var titleView: some View {
        Text(article.title)
            .font(.ptsBold20)
            .foregroundColor(.white)
            .padding(.horizontal)
    }
    
    private var abstractView: some View {
        Text(article.abstract)
            .font(.ptsBold15)
            .foregroundColor(.gray)
            .padding(.horizontal)
    }
    
    @ViewBuilder
    private func articleImage(media: [Media]) -> some View {
        if let firstMedia = media.first, let metadata = firstMedia.mediaMetadata.first(where: { $0.format == .mediumThreeByTwo440 }) {
            AsyncImage(url: URL(string: metadata.url)) { image in
                image.resizable()
                    .scaledToFit()
            } placeholder: {
                Color.gray
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    private var metadataView: some View {
        HStack {
            Text(article.byline)
                .font(.caption)
                .foregroundColor(.gray)
            Spacer()
            Text(article.publishedDate)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding(.horizontal)
    }
}

#Preview {
    DetailView(article: Result.sampleData)
        .preferredColorScheme(.dark)
}
