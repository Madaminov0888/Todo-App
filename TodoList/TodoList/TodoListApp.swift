//
//  TodoListApp.swift
//  TodoList
//
//  Created by Muhammadjon Madaminov on 12/07/23.
//

import SwiftUI

/*
 MVVM architecture
 Model - data point
 View - UI
 ViewModel - manages Models for view
 
 */

@main
struct TodoListApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
