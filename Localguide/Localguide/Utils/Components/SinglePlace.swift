//
//  SinglePlace.swift
//  Localguide
//
//  Created by Jiami Jongejan on 22/2/2024.
//

import Foundation
import SwiftUI
import MapKit

struct SinglePlaceText: View {
    var idInt: Int
    var name: String
    var description: String
    var image: String
    var keywords: [String]
    var dishes: [String]
    var neighbourhood: String
    var coordinates: [Float]
    var address: String
    var ratingInt: Int
    
    init (place: Place) {
        self.idInt = Int(place.id) ?? 0
        self.name = place.name
        self.description = place.description
        self.image = place.image
        self.keywords = place.keywords
        self.dishes = place.dishes
        self.neighbourhood = place.neighbourhood
        self.coordinates = place.coordinates
        self.address = place.address
        self.ratingInt = Int(place.rating) ?? 0
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView{
                VStack {
                    Spacer(minLength: geometry.size.height * 0.35)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Spacer().frame(height: 8)
                       
                        // title
                        HStack(){
                            Text(name)
                                .font(.custom("Nunito-ExtraBold", size: 28))
                                .foregroundColor(LocalguideColor.darkblue)
                            Spacer()
                            Image(systemName: "heart")
                                .foregroundColor(LocalguideColor.red)
                                .font(.custom("Nunito-SemiBold", size: 24))
                        }
                        .padding(.horizontal)
                        
                        Spacer().frame(height: 8)
                        
                        // stars
                        RatingBlock(rating: ratingInt, fontSize: 12)
                        
                        Spacer().frame(height: 8)
                        
                        // keywords
                        KeywordsBlock(keywords: keywords, fontSize: 12)
                        
                        Spacer()
                            .frame(height: 5)
                        
                        Text(description)
                            .font(.custom("Nunito-Bold", size: 18))
                            .foregroundColor(LocalguideColor.darkblue)
                            .padding(.horizontal)
                        
                        Spacer()
                            .frame(height: 10)
                        
                        // map
                        VStack {
                            Spacer()
                                .frame(height: 30)
                            
                            HStack {
                                Spacer()
                                Map(coordinateRegion: .constant(MKCoordinateRegion(
                                    center: CLLocationCoordinate2D(latitude: CLLocationDegrees(coordinates[0]),
                                                                   longitude: CLLocationDegrees(coordinates[1])),
                                    span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                                )), interactionModes: [])
                                .cornerRadius(30)
                                .frame(width: geometry.size.width * 0.90, height: 200)
                                Spacer()
                                
                            }
                            
                            VStack(alignment: .leading) {
                                HStack(){
                                    Text(neighbourhood)
                                        .font(.custom("Nunito-Bold", size: 18))
                                        .foregroundColor(LocalguideColor.red)
                                        .padding(.horizontal)
                                    Spacer()
                                }
                                
                                Text(address)
                                    .font(.custom("Nunito-BoldItalic", size: 14))
                                    .foregroundColor(LocalguideColor.red)
                                    .padding(.horizontal)
                                
                                Spacer()
                                    .frame(height: 10)
                            }
                            .frame(width: geometry.size.width)
                            
                            Spacer()
                                .frame(height: 10)
                            
                        }
                        .background(LocalguideColor.beige)
                        .cornerRadius(30)
                        .frame(width: geometry.size.width, height: 300)
                    }
                    .background(Color.white)
                    .cornerRadius(30)
                }
            }
        }
    }
}
