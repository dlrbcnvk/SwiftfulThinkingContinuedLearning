//
//  MultipleSheetsBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by 조성규 on 2022/09/30.
//

import SwiftUI

struct RandomModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
}

// 1 - use a binding
// 2 - use multiple .sheets
// 3 - use $item

struct MultipleSheetsBootcamp: View {
    
    @State var selectedModel: RandomModel? = nil
    
    @State var showSheet: Bool = false
    
    @State var showSheet1: Bool = false
    @State var showSheet2: Bool = false
    
    
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                
                ForEach(0..<50) { index in
                    Button("Button \(index)") {
                        selectedModel = RandomModel(title: "\(index)")
                        showSheet1.toggle()
                    }
                    //            .sheet(isPresented: $showSheet1) {
                    //                NextScreen(selectedModel: RandomModel(title: "ONE"))
                    //            }
                    
                }
                
                
                Button("Button 2") {
                    selectedModel = RandomModel(title: "TWO")
                    showSheet2.toggle()
                }
                //            .sheet(isPresented: $showSheet2) {
                //                NextScreen(selectedModel: RandomModel(title: "TWO"))
                //            }
            }
            .sheet(item: $selectedModel) { model in
                NextScreen(selectedModel: model)
            }
        }
    
//        .sheet(isPresented: $showSheet) {
//            NextScreen(selectedModel: $selectedModel)
//        }
    }
}

struct NextScreen: View {
    
//    @Binding var selectedModel: RandomModel
    let selectedModel: RandomModel
    
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

struct MultipleSheetsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSheetsBootcamp()
    }
}
