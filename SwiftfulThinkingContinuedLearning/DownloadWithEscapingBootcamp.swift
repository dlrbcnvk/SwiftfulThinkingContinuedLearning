//
//  DownloadWithEscapingBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by 조성규 on 2022/10/03.
//

import SwiftUI

struct PostModel: Identifiable, Codable {
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

class DownloadWithEscapingViewModel: ObservableObject {
    
    @Published var posts: [PostModel] = []
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        downloadData(from: url) { data in
            guard let data = data else { return }
            guard let newPosts = try? JSONDecoder().decode([PostModel].self, from: data) else { return }
            DispatchQueue.main.async { [weak self] in
                self?.posts = newPosts
            }
        }
    }
    
    func downloadData(from url: URL, completionHandler: @escaping (_ data: Data?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error in URLSession. \(error.localizedDescription)")
                completionHandler(nil)
                return
            }
            guard let data = data else {
                print("No Data.")
                completionHandler(nil)
                return
            }
            guard let response = response as? HTTPURLResponse else {
                print("Invalid response.")
                completionHandler(nil)
                return
            }
            guard response.statusCode >= 200 && response.statusCode < 300 else {
                print("Status code should be 2xx, but is \(response.statusCode)")
                completionHandler(nil)
                return
            }
            completionHandler(data)
        }.resume()
    }
}

struct DownloadWithEscapingBootcamp: View {
    
    @StateObject var vm = DownloadWithEscapingViewModel()
    
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
                .frame(maxWidth: .infinity, alignment: .leading)
                .shadow(radius: 10)
                .cornerRadius(10)
            }
        }
    }
}

struct DownloadWithEscapingBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DownloadWithEscapingBootcamp()
    }
}
