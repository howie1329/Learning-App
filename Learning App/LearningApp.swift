//
//  Learning_AppApp.swift
//  Learning App
//
//  Created by Howard Thomas on 2/12/23.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
