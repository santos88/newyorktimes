//
//  ArticleViewModel.swift
//  The New York Times
//
//  Created by Santos Ramon on 19/02/24.
//

import SwiftUI

class ArticleViewModel: ObservableObject, LoadingViewModel {
    @Published var articles: [Result] = []
    @Published var state: LoadingViewState = .loading
    var errorMessage: String = ""


    func loadContent() {
        loadArticles(period: 30)
    }
    
    func loadArticles(period: Int) {
        state = .loading
        ApiService.shared.getMostPopularArticles(period: period) { [weak self] results, error in
            DispatchQueue.main.async {
                if let results = results {
                    self?.articles = results
                    self?.state = .success
                } else if let error = error {
                    self?.errorMessage = error.localizedDescription
                    self?.state = .error(error.localizedDescription)
                }
            }
        }
    }
}
