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
        center: CLLocationCoordinate2D(latitude: 52.36737874830171, longitude: 4.893015029625628),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    func fetchPlaces(){
        self.backend.loadPlaces(completed: false) { (success, data) in
            DispatchQueue.main.async {
                self.places = data!
                self.loadingPlaces = false
            }
        }
    }
        
    var body: some View {
        if(self.loadingPlaces) {
            LoadingView()
                .onAppear(perform: self.fetchPlaces)
        } else {
            NavigationView{
                Map(coordinateRegion: $region,
                     annotationItems: places
                 ) { place in
                    MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: CLLocationDegrees(place.coordinates[0]), longitude: CLLocationDegrees(place.coordinates[1]))) {
                        NavigationLink(destination: SinglePlaceView(place: place)) {
                            PlaceAnnotationView()
                        }
                   }
                 }
                    .edgesIgnoringSafeArea(.top)
                }
            }
        }
    }

struct PlaceAnnotationView: View {
  var body: some View {
    VStack(spacing: 0) {
      Image(systemName: "mappin.circle.fill")
        .font(.title)
        .foregroundColor(LocalguideColor.red)
      
      Image(systemName: "arrowtriangle.down.fill")
        .font(.caption)
        .foregroundColor(LocalguideColor.red)
        .offset(x: 0, y: -5)
    }
  }
}
