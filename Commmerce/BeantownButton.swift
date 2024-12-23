//
//  BeantownButton.swift
//  Commmerce
//
//  Created by Avinash on 23/12/2024.
//

import SwiftUI
import MapKit

struct BeantownButton: View {
    
    
    @Binding var searchResults: [MKMapItem]?
    @Binding var position: MapCameraPosition
    @Binding var visibleRegion: MKCoordinateRegion?

    func search(for query: String){
        let request = MKLocalSearch.Request ()
        request.naturalLanguageQuery = query
        request.resultTypes = .pointOfInterest
        request.region = visibleRegion ?? MKCoordinateRegion(center: .parking, span: MKCoordinateSpan(latitudeDelta: 0.0125, longitudeDelta: 0.0125))
        
        Task{
            let search = MKLocalSearch(request: request)
            let response = try? await search.start()
            searchResults = response?.mapItems ?? []
        }

    }
    
    var body: some View {
        HStack(spacing: 10) {
            Button {
                search(for: "Playgrounds")
            } label: {
                Label("Playgrounds", systemImage: "figure.and.child.holdinghands")
            }
            
            Button {
                search(for: "Beach")
            } label: {
                Label("Beaches", systemImage: "beach.umbrella")
            }

            Button {
                position = .region(.boston)
            } label: {
                Label("Boston", systemImage: "building.2")
            }

            Button {
                position = .region(.northShore)
            } label: {
                Label("North Shore", systemImage: "water.waves")
            }
        }
        .labelStyle(.iconOnly)

    }
}

#Preview {
    BeantownButton(searchResults: Binding(get: {
        []
    }, set: { _ in
        
    }), position: Binding(get: {.automatic}, set: { _ in
        
    }), visibleRegion: Binding(get: { nil }, set: { _ in
        
    }))
}
