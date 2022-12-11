//
//  Hardware_storeApp.swift
//  Hardware_store
//
//  Created by Yuliya Ratkevcih on 19.11.22.
//

import SwiftUI

@main
struct Hardware_storeApp: App {
    @StateObject var listVM = ListViewModel(service: APIServiceList())
    var body: some Scene {
        WindowGroup {
            ListView(viewModel: listVM)
        }
    }
}
