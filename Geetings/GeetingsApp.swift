//
//  GeetingsApp.swift
//  Geetings
//
//  Created by administrator on 17/08/2024.
//

import SwiftUI
import TipKit

@main
struct GeetingsApp: App {
    
    @AppStorage("Language") var asLanguage: String = "en"
    @AppStorage("Direction") var asLayoutDirectionString: String = LEFT_To_RIGHT
    
    var body: some Scene {
        
        let resetTip = false
        
        var layoutDiection: LayoutDirection {
            asLayoutDirectionString == LEFT_To_RIGHT ? .leftToRight : .rightToLeft
        }
        
        WindowGroup {
            MainView(
                language: $asLanguage,
                layoutDirectionString: $asLayoutDirectionString)
            .environment(\.locale, Locale(identifier: asLanguage))
            .environment(\.layoutDirection, layoutDiection)
            .task {
                if resetTip {
                    try? Tips.resetDatastore()
                }
                // Configure and load your tips at app launch.
                    try? Tips.configure([
                        .displayFrequency(.immediate),
                        .datastoreLocation(.applicationDefault)
                    ])
                }
            }
        }
    }

