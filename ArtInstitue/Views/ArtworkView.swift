//
//  ArtworkView.swift
//  ArtInstitue
//
//  Created by Y K on 12.12.2023.
//

import SwiftUI

struct ArtworkView: View {
    let artwork: ArtworkModel
    var body: some View {
        NavigationLink {
            ArtworkDetailView(artwork: artwork)
        } label: {
            Text(artwork.title)
        }
    }
}

#Preview {
    ArtworkView(artwork: previewArtwork)
        .previewLayout(.sizeThatFits)
}
