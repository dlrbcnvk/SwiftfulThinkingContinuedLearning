//
//  DownloadWithCombineBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by 조성규 on 2022/10/03.
//

import SwiftUI
import Combine

struct Post: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
    enum CodingKeys: CodingKey {
        case userId
        case id
        case title
        case body
    }
}

class DownloadWithCombineViewModel: ObservableObject {
    
    @Published var posts: [Post] = []
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else  { return }
        
        // Combine discussion:
        /*
        // 1. sign up for monthly subscription for package to be delivered
        // 2. the company would make the package behind the scene
        // 3. receive the package at your front door
        // 4. make sure the box isn't damaged
        // 5. open and make sure the item is correct
        // 6. use the item!!
        // 7. cancellable at any time!
        
        // 1. create the publisher
        // 2. subscribe publisher on bachground thread
        //    default background -> don't explicitly need to do
        // 3. receive on main thread
        // 4. tryMap (check that the data is good)
        // 5. decode (decode data into Posts)
        // 6. sink (put the item into our app)
        // 7. store (cancel subscription if needed)
         */
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: [Post].self, decoder: JSONDecoder())
            .sink { completion in
                switch completion {
                case .finished:
                    print(completion)
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            } receiveValue: { [weak self] posts in
                self?.posts = posts
            }
            .store(in: &cancellables)
    }
    
    func handleOutput(output: Publishers.SubscribeOn<URLSession.DataTaskPublisher, DispatchQueue>.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else { throw URLError(.badServerResponse) }
        return output.data
    }
}

struct DownloadWithCombineBootcamp: View {
    
    @StateObject var vm = DownloadWithCombineViewModel()
    
    var body: some View {
        List {
            ForEach(vm.posts) { post in
                VStack(alignment: .leading) {
                    Text(post.title)
                        .font(.headline)
                        .padding(.bottom)
                    Text(post.body)
                        .foregroundColor(.gray)
                }
                .padding(.vertical)
                .frame(maxWidth: .infinity)
            }
        }
    }
}

struct DownloadWithCombineBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DownloadWithCombineBootcamp()
    }
}
