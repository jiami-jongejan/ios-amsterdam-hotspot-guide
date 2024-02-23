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
                }
            }
            .edgesIgnoringSafeArea(.top)
            SinglePlaceText(place: place)
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
            address: "Frans Halsstraat 12",
            rating: "4"
        ))
    }
}

struct SinglePlaceContentView_Previews: PreviewProvider {
    static var previews: some View {
        SinglePlaceContentView()
    }
}
