//
//  ContentView.swift
//  BaiduDemo
//
//  Created by 邓璟琨 on 2023/2/8.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        MapView()
            .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
