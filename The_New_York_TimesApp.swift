//
//  The_New_York_TimesApp.swift
//  The New York Times
//
//  Created by Santos Ramon on 14/02/24.
//

import SwiftUI

@main
struct The_New_York_TimesApp: App {
    
    var body: some Scene {
        WindowGroup {
            ArticleView(viewModel: ArticleViewModel())
        }
    }
    
}
