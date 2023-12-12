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
            .sink { eceiveValue: <#T##((ArtworkDataResponse) -> Void)##((ArtworkDataResponse) -> Void)##(ArtworkDataResponse) -> Void#>)
    }
    
}
