//
//  ArraysBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by 조성규 on 2022/10/02.
//

import SwiftUI

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String
    let points: Int
    let isVerified: Bool
}

class ArrayModificationViewModel: ObservableObject {
    
    @Published var dataArray: [UserModel] = []
    @Published var filteredArray: [UserModel] = []
    @Published var mappedArray: [String] = []
    
    init() {
        getUsers()
        updateFilteredArray()
    }
    
    func updateFilteredArray() {

//        filteredArray = dataArray.sorted { $0.points > $1.points }
        
//        filteredArray = dataArray.filter { $0.isVerified }
        
//        mappedArray = dataArray.map { $0.name }
        
        mappedArray = dataArray
            .sorted(by: { $0.points > $1.points })
            .filter({ $0.isVerified })
            .map({ $0.name })
        
    }
    
    func getUsers() {
        let user1 = UserModel(name: "Nick", points: 5, isVerified: true)
        let user2 = UserModel(name: "Chris", points: 0, isVerified: true)
        let user3 = UserModel(name: "Joe", points: 20, isVerified: false)
        let user4 = UserModel(name: "Jay", points: 5, isVerified: true)
        let user5 = UserModel(name: "Santhos", points: 23, isVerified: true)
        let user6 = UserModel(name: "Lisa", points: 5, isVerified: false)
        let user7 = UserModel(name: "Steve", points: 77, isVerified: true)
        let user8 = UserModel(name: "Amanda", points: 34, isVerified: false)
        let user9 = UserModel(name: "Emily", points: 21, isVerified: false)
        let user10 = UserModel(name: "Brandon", points: 92, isVerified: true)
        self.dataArray.append(contentsOf: [user1, user2, user3, user4, user5, user6, user7, user8, user9, user10])
    }
}

struct ArraysBootcamp: View {
    
    @StateObject var vm = ArrayModificationViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                ForEach(vm.mappedArray, id: \.self) { name in
                    Text(name)
                        .font(.title)
                }
                
//                ForEach(vm.filteredArray) { user in
//                    VStack(alignment: .leading) {
//                        Text(user.name)
//                        HStack {
//                            Text("Points: \(user.points)")
//                            Spacer()
//                            if user.isVerified {
//                                Image(systemName: "flame.fill")
//                            }
//                        }
//                    }
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color.blue.cornerRadius(10))
//                    .padding(.horizontal)
//                }
            }
        }
    }
}

struct ArraysBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ArraysBootcamp()
    }
}
