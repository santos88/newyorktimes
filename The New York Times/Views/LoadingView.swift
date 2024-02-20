//
//  LoadingView.swift
//  The New York Times
//
//  Created by Santos Ramon on 19/02/24.
//

import Foundation
import SwiftUI

enum LoadingViewState {
    case loading
    case success
    case error(String)
}

protocol LoadingViewModel: ObservableObject {
    var state: LoadingViewState { get set }
    var errorMessage: String { get }
    func loadContent()
}

extension LoadingViewModel {
    func loadContentIfNeeded() {
        switch state {
        case .loading, .success:
            loadContent()
        case .error:
            break
        }
    }
}

protocol LoadingView: View {
    associatedtype ContentView: View
    var viewModel: any LoadingViewModel { get }
    func contentView() -> ContentView
}

extension LoadingView {
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                ProgressView("Loading...")
                    .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                    .foregroundColor(.gray)
            case .success:
                contentView()
            case .error(let message):
                Text("Error: \(message)")
            }
        }
        .onAppear(perform: viewModel.loadContentIfNeeded)
        .preferredColorScheme(.dark)
    }
}
