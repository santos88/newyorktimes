//
//  ArticleSectionView.swift
//  The New York Times
//
//  Created by Santos Ramon on 19/02/24.
//

import SwiftUI

struct ArticleSectionView: View {
    let article: Result
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(article.title)
                .font(.ptsBold20)
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
            
            Text(article.abstract)
                .font(.ptsBold15)
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
            
            articleImage(media: article.media)
                .aspectRatio(contentMode: .fit)
                .clipped()
                .padding(.bottom, 5)
            
            HStack {
                Spacer()
                Text(article.byline)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.bottom, 5)
            }
            
            Divider()
                .frame(height: 0.5)
                .background(Color.white)
        }
    }
    
    @ViewBuilder
    private func articleImage(media: [Media]) -> some View {
        if let firstMedia = media.first, let metadata = firstMedia.mediaMetadata.first(where: { $0.format == .mediumThreeByTwo440 }) {
            AsyncImage(url: URL(string: metadata.url)) { image in
                image.resizable()
            } placeholder: {
                Color.gray
            }
        }
    }
}

#Preview {
    ArticleSectionView(article: Result.sampleData)
        .preferredColorScheme(.dark)
}
