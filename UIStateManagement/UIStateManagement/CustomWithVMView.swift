//
//  CustomWithVMView.swift
//  UIStateManagement
//
//  Created by Viennarz Curtiz on 5/15/23.
//

import SwiftUI

struct CustomWithVMView: View {
    @StateObject private var viewModel = CustomViewVMViewModel()
    
    var body: some View {
        ZStack {
            
            switch viewModel.state {
            case .populated:
                Text("Populated")
            
            case .empty:
                Text("Empty")
                
            case .loading:
                ProgressView()
                
            case .error:
                Text("Error")
            }
        }
        .onAppear {
            viewModel.state = .loading
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(Int(3.0))) {
                viewModel.state = .populated
            }
        }
        .onDisappear {
            viewModel.state = .loading
        }
    }
    
    
}


struct CustomWithVMView_Previews: PreviewProvider {
    static var previews: some View {
        CustomWithVMView()
    }
}
