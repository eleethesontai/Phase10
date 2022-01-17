//
//  Phase10App.swift
//  Phase10
//
//  Created by William Storey on 11/26/21.
//

import SwiftUI

@main
struct Phase10App: App {
    
    @ObservedObject var viewModel = ApplicationViewModel()
    
    var body: some Scene {
        WindowGroup {
            GamesView()
                .environmentObject(self.viewModel)
        }
    }
    
}
