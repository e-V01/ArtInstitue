//
//  ContentView.swift
//  ArtInstitue
//
//  Created by Y K on 12.12.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ArtworkViewModel()
    var body: some View {
        NavigationStack {
            List(viewModel.artworks) { artwork in
                ArtworkView(artwork: artwork)
                
            }
            .navigationTitle("Artworks")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                viewModel.fetchArtwork()
            }
        }
    }
}

#Preview {
    ContentView()
}
