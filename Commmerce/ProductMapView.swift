//
//  ProductMapView.swift
//  Commmerce
//
//  Created by Avinash on 23/12/2024.
//

import SwiftUI
import MapKit

struct ProductMapView: View {
    
    @State var mapPosition: MapCameraPosition = .automatic
    @State var selected: MKMapItem?
    @State var searchResults: [MKMapItem]?
    @State var visibleRegion: MKCoordinateRegion?
    @State var route: MKRoute?

    var body: some View {
        MapReader { proxy in
            Map(position: $mapPosition, selection: $selected){
                Annotation("Parking", coordinate: .parking) {
                    //Custom annotation
                    ZStack{
                        RoundedRectangle(cornerRadius: 5)
                            .fill(.background)
                        RoundedRectangle (cornerRadius: 5)
                            .stroke(.secondary, lineWidth: 5)
                        Image(systemName: "car")
                            .padding(5)

                    }
                }
                ForEach(searchResults ?? [], id: \.self) { result in
                    Marker(item: result)
                }
                .annotationTitles(.hidden)
                
                if let route = route{
                    MapPolyline(route)
                        .stroke(.blue, lineWidth: 5)
                }
            }
        }
        .mapControls {
            MapUserLocationButton()
            MapCompass()
            MapScaleView()
        }
        .mapStyle(.standard)
        .safeAreaInset(edge: .bottom) {
            HStack{
                Spacer()
                VStack(spacing: 0, content: {
//
                    BeantownButton(searchResults: $searchResults, position: $mapPosition, visibleRegion: $visibleRegion)
                        .padding(.top)
                })
                
                Spacer()
            }
            .background(.thinMaterial)
        }
        .onChange(of: selected) {
            getDirections()
        }
    }
    
    func getDirections(){
        route = nil
        guard let selected else { return }
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: .parking))
        request.destination = selected
        
        Task{
            let directions = MKDirections(request: request)
            let response = try? await directions.calculate()
            route = response?.routes.first
        }
    }

}

#Preview {
    ProductMapView()
}


extension CLLocationCoordinate2D{
    static let parking = CLLocationCoordinate2D(latitude: 42.354528, longitude: -71.068369)
}

extension MKCoordinateRegion {
    
    static let boston = MKCoordinateRegion ( center: CLLocationCoordinate2D( latitude: 42.360256,
                                                                             longitude: -71.057279), span: MKCoordinateSpan ( latitudeDelta: 0.1,
                                                                                                                              longitudeDelta: 0.1))
    
    static let northShore = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 42.547408,
            longitude: -70.870085),
        span: MKCoordinateSpan(
            latitudeDelta: 0.5,
            longitudeDelta: 0.5))
    
    static let delhi = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 28.6139,
            longitude: 77.2088),
        span: MKCoordinateSpan(
            latitudeDelta: 0.5,
            longitudeDelta: 0.5))

    
}

