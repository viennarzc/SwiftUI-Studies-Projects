//
//  CustomContainerMainView.swift
//  UIStateManagement
//
//  Created by Viennarz Curtiz on 5/16/23.
//

import SwiftUI

struct CustomContainerMainView: View {
    @State private var state: ViewState = .empty
    
    var body: some View {
        VStack {
            CustomChildView(state: $state)
            
            Button {
                state = .loading
            } label: {
                Text("Parent Button - Start Loading")
            }
            .buttonStyle(.borderedProminent)

        }
    }
}

struct CustomContainerMainView_Previews: PreviewProvider {
    static var previews: some View {
        CustomContainerMainView()
    }
}


struct CustomChildView: View {
    @Binding var state: ViewState
    
    var body: some View {
        ZStack {
            
            VStack {
                switch state {
                case .populated:
                    Text("Populated")
                    
                case .empty:
                    Text("Empty")
                    
                case .loading:
                    ProgressView()
                    
                case .error:
                    Text("Error")
                }
                
                Button {
                    state = .loading
                } label: {
                    Text("Start Loading")
                }
                
                Button {
                    state = .error
                } label: {
                    Text("Show Error")
                }
                
                Button {
                    state = .populated
                } label: {
                    Text("Show Populuted")
                }

            }
            
        }
    }
}
