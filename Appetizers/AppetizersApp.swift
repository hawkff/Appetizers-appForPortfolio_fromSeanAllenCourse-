//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by mrcat on 11/25/23.
//

import SwiftUI

@main
struct AppetizersApp: App {
    var order = Order()

    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
