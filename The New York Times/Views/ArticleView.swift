//
//  ArticleView.swift
//  The New York Times
//
//  Created by Santos Ramon on 19/02/24.
//

import SwiftUI

struct ArticleView: LoadingView {
    var viewModel: any LoadingViewModel
    @ObservedObject var articleViewModel: ArticleViewModel
    
    init(viewModel: ArticleViewModel = ArticleViewModel()) {
        self.articleViewModel = viewModel
        self.viewModel = viewModel
        configureNavigationBarAppearance()
    }
    
    func contentView() -> some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    articleLinks()
                }
                .padding()
            }
            .navigationTitle("The New York Times")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    @ViewBuilder
    private func articleLinks() -> some View {
        ForEach(articleViewModel.articles) { article in
            NavigationLink(destination: DetailView(article: article)) {
                ArticleSectionView(article: article)
                    .foregroundColor(.primary)
            }
        }
    }
    
    private func configureNavigationBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont(name: "Walbaum-FrakturUNZ1", size: 25) ?? UIFont.systemFont(ofSize: 25),
            .kern: 1.0
        ]
        
        appearance.buttonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
        UINavigationBar.appearance().tintColor = .white
    }
}

#Preview {
    ArticleView(viewModel: ArticleViewModel())
        .preferredColorScheme(.dark)
}

