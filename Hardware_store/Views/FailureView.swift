//
//  FailureView.swift
//  Hardware_store
//
//  Created by Yuliya Ratkevcih on 25.11.22.
//

import SwiftUI

struct FailureView: View {
    var body: some View {
        VStack {
            Text("❌")
            Text("The server cannot find the requested resource")
            
        }
    }
}

struct FailureView_Previews: PreviewProvider {
    static var previews: some View {
        FailureView()
    }
}
