//
//  SinglePlaceView.swift
//  Localguide
//
//  Created by Jiami Jongejan on 24/4/2023.
//

import SwiftUI
import MapKit

struct SinglePlaceView: View {
    var place: Place
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(showsIndicators: false) {
                ZStack(alignment: .top) {
                    AsyncImage(url: URL(string: place.image)) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: geometry.size.width, height: geometry.size.height * 0.5)
                                .clipped()
                        } else if phase.error != nil {
                            Color.gray
                        } else {
                            ProgressView()
                        }
                    }
                    .frame(height: geometry.size.height * 0.5)
                    
                    VStack {
                        Spacer(minLength: geometry.size.height * 0.5)
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text(place.name)
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.horizontal)
                            
                            Text(place.description)
                                .font(.body)
                                .padding(.horizontal)
                            
                            Map(coordinateRegion: .constant(MKCoordinateRegion(
                                center: CLLocationCoordinate2D(latitude: CLLocationDegrees(place.coordinates[0]),
                                                               longitude: CLLocationDegrees(place.coordinates[1])),
                                span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                            )), interactionModes: [])
                            .frame(height: 200)
                            .disabled(true)
                            
                            Text(place.address)
                                .font(.footnote)
                                .padding(.horizontal)
                            
                        }
                        .background(Color.white)
                        .frame(width: geometry.size.width)
                    }
                }
            }
            .edgesIgnoringSafeArea(.top)
        }
    }
}

struct SinglePlaceContentView: View {
    var body: some View {
        SinglePlaceView(place: Place(
            id: "0",
            name: "Café Caron",
            description: "French restaurant with a lovely atmosphere, great for a Burgundian dinner with some cheese and wine. It will give you the perfect Paris bistro vibes with amazing food.",
            image: "https://localguidestorage.blob.core.windows.net/images/cafecaron.JPG",
            keywords: ["Drinks", "Cozy"],
            dishes: [],
            neighbourhood: "Pijp",
            coordinates: [52.37287436362199, 4.8894113883891634],
            address: "",
            rating: "4"
        ))
    }
}

struct SinglePlaceContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
