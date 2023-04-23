//
//  FullMapView.swift
//  Localguide
//
//  Created by Jiami Jongejan on 23/4/2023.
//

import SwiftUI
import MapKit

struct FullMapView: View {
    @StateObject var backend: LocalguideBackend = LocalguideBackend()
    @State private var places: [Place]  = []
    @State private var loadingPlaces: Bool = true
    
    @State private var region =
    MKCoordinateRegion(
    center: CLLocationCoordinate2D(
        latitude: 22.33787,
        longitude: 114.18131
    ),
    span: MKCoordinateSpan(
        latitudeDelta: 0.005,
        longitudeDelta: 0.005
    )
    )
    
    func fetchPlaces(){
        self.backend.loadPlaces(completed: false) { (success, data) in
            DispatchQueue.main.async {
                self.places = data!
                self.loadingPlaces = false
            }
        }
    }
    
    // TODO: Bug in the map, annotationitems is not identifiable.
    
    var body: some View {
        if(self.loadingPlaces) {
            LoadingView()
                .onAppear(perform: self.fetchPlaces)
        } else {
            NavigationView{
                Map(coordinateRegion: $region, annotationItems: places) { place in
                    MapMarker(coordinate:
                                CLLocationCoordinate2D(
                                    latitude: CLLocationDegrees(place.coordinates[0]),
                                    longitude: CLLocationDegrees(place.coordinates[1])
                                ))
                }
                    .edgesIgnoringSafeArea(.top)
                }
            }
        }
    }


struct FullMapView_Previews: PreviewProvider {
    static var previews: some View {
        FullMapView()
    }
}
