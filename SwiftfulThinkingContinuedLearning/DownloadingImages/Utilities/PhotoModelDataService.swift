//
//  PhotoModelDataService.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by 조성규 on 2022/10/04.
//

import Foundation
import Combine

class PhotoModelDataService {
    
    static let shared = PhotoModelDataService() // singleton
    private init() {
        downloadData()
    }
    
    @Published var photoModels: [PhotoModel] = []
    var cancellables = Set<AnyCancellable>()
    
    func downloadData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: [PhotoModel].self, decoder: JSONDecoder())
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error): // handleOutput's error comes through here
                    print("Erorr downloading data. \(error.localizedDescription)")
                }
            } receiveValue: { [weak self] models in
                guard let self = self else { return }
                self.photoModels = models
            }
            .store(in: &cancellables)

    }
    
    private func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
}
