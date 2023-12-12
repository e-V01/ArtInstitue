//
//  ArtworkViewModel.swift
//  ArtInstitue
//
//  Created by Y K on 12.12.2023.
//

import Combine
import Foundation

class ArtworkViewModel: ObservableObject {
    // only assigns value
    @Published private(set) var  artworks = [ArtworkModel]()
    private var cancellables = Set<AnyCancellable>()
    private let jsonDecoder = JSONDecoder()
    
    func fetchArtwork() {
        guard let url = URL(string: "https://api.artic.edu/api/v1/artworks") else { return }
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: ArtworkDataResponse.self, decoder: jsonDecoder)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("Error: \(error)")
                case .finished:
                    print("It is finished")
                }
            } receiveValue: { [weak self] response in
                self?.artworks = response.data
            }
            .store(in: &cancellables)
    }
    
}
