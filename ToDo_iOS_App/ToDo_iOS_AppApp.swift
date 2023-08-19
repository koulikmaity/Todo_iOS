//
//  ToDo_iOS_AppApp.swift
//  ToDo_iOS_App
//
//  Created by Koulik Maity on 16/08/23.
//

import SwiftUI

@main
struct ToDo_iOS_AppApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
