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
            CustomWithinView()
                .tabItem {
                    Image(systemName: "1.circle.fill")
                }
            
            CustomWithVMView()
                .tabItem {
                    Image(systemName: "2.circle.fill")
                }
            CustomContainerMainView()
                .tabItem {
                    Image(systemName: "3.circle.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


class CustomViewVMViewModel: ObservableObject {
    @Published var state: ViewState = .empty
}

