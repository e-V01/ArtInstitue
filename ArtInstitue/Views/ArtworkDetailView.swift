//
//  ArtworkDetailView.swift
//  ArtInstitue
//
//  Created by Y K on 12.12.2023.
//

import SwiftUI

struct ArtworkDetailView: View {
    let artwork: ArtworkModel
    var body: some View {
        ScrollView {
            artworkImgView
            
            Text(artwork.title)
                .font(.title)
                .padding()
        }
        .navigationTitle("ArtWork Details")
        .navigationBarTitleDisplayMode(.inline)
    }
    @ViewBuilder var artworkImgView: some View {
        if let imgId = artwork.imgId,
           let imgUrl = URL(string: "https://www.artic.edu/iiif/2/\(imgId)/full/843,/0/default.jpg") {
            AsyncImage(url: imgUrl) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
        } else {
            Text("Images is not available")
        }
    }
}

#Preview {
    ArtworkDetailView(artwork: previewArtwork)
}
