//
//  ArtworkModel.swift
//  ArtInstitue
//
//  Created by Y K on 12.12.2023.
//

struct ArtworkDataResponse: Decodable {
    let data: [ArtworkModel]
}

struct ArtworkModel: Decodable, Identifiable {
    let id: Int
    let title: String
    let imgId: String?
}

let previewArtwork = ArtworkModel(id: 16487, title: "The Bay of Marseille from L", imgId: "d4ca6321-8656-3d3f-a362-2ee297b2b813")
