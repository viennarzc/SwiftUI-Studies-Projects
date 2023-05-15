//
//  ContentView.swift
//  UIStateManagement
//
//  Created by Viennarz Curtiz on 5/15/23.
//

import SwiftUI


enum ViewState {
    case loading
    case populated
    case empty
    case error
}


struct ContentView: View {
    var body: some View {
        TabView {
            WithinOwnView()
            .tabItem {
                Image(systemName: "1.circle.fill")
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WithinOwnView: View {
    @State private var state: ViewState = .loading
    
    var body: some View {
        ZStack {
            
            switch state {
            case .populated:
                Text("Populated")
            
            case .empty:
                Text("Empty")
                
            case .loading:
                EmptyView()
                
            case .error:
                Text("Error")
            }

            if state == .loading {
                ProgressView()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(Int(3.0))) {
                state = .populated
            }
        }
    }
}
