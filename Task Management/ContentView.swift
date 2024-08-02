//
//  ContentView.swift
//  Task Management
//
//  Created by Vikrant Vani on 02/08/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home_Page()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.BG)
            .preferredColorScheme(.light)
        
    }
}

#Preview {
    ContentView()
}
