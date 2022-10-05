//
//  HashableBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by 조성규 on 2022/10/02.
//

import SwiftUI

struct MyCustomModel: Hashable {
    let title: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}

struct HashableBootcamp: View {
    
    let data: [MyCustomModel] = [
        MyCustomModel(title: "ONE"),
        MyCustomModel(title: "ONE"),
        MyCustomModel(title: "ONE"),
        MyCustomModel(title: "ONE"),
        MyCustomModel(title: "TWO"),
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                
//                ForEach(data) { item in
//                    Text(item.id)
//                        .font(.headline)
//                }
                
                ForEach(data, id: \.self) { item in
                    Text(item.hashValue.description)
                        .font(.headline)
                }
            }
        }
    }
}

struct HashableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        HashableBootcamp()
    }
}
