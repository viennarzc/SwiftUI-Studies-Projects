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
        CustomChildView(state: $state)
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
            state = .loading
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(Int(3.0))) {
                state = .populated
            }
        }
        .onDisappear {
            state = .loading
        }
    }
}
