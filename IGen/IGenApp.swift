//
//  IGenApp.swift
//  IGen
//
//  Created by Marco Mascorro on 7/3/23.
//

import SwiftUI

@main
struct IGenApp: App {
    var body: some Scene {
        WindowGroup {
            #if targetEnvironment(macCatalyst)
            ContentView()
                .onAppear {
                    guard let scenes = UIApplication.shared.connectedScenes as? Set<UIWindowScene> else { return }
                    for window in scenes {
                        window.title = "iGen"
                        guard let sizeRestrictions = window.sizeRestrictions else { continue }
                        sizeRestrictions.minimumSize = CGSize(width: 360, height: 600)
                        sizeRestrictions.maximumSize = sizeRestrictions.minimumSize
                    }
                }
            #else
            NavigationView {
                ContentView()
                    .navigationTitle("iGen")
            }
            .navigationViewStyle(StackNavigationViewStyle())
            #endif
        }
    }
}
