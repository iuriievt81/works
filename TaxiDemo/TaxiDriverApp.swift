//
//  TaxiDriverApp.swift
//  TaxiDriver
//
//  Created by Iurii Evteev on 1/29/25.
//

import SwiftUI
@main

struct TaxiDriverApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
                WelcomView()
            }
            .navigationViewStyle(.stack)
        }
    }
}
