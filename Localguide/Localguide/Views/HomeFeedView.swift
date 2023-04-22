//
//  HomeFeedView.swift
//  Localguide
//
//  Created by Jiami Jongejan on 22/4/2023.
//

import SwiftUI

struct HomeFeedView: View {
    
    @StateObject var backend: LocalguideBackend = LocalguideBackend()
    @State private var places: [Place]  = []
    @State private var loadingPlaces: Bool = true
    
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
            Text("Loading")
                .onAppear(perform: self.fetchPlaces)
        }
        else {
            VStack{
                List(places, id: \.name) {place in
                    Text(place.name)
                }
            }
            .background(LocalguideColor.beige)
            .refreshable {
                self.fetchPlaces()
            }
        }
    }
}

struct HomeFeedView_Previews: PreviewProvider {
    static var previews: some View {
        HomeFeedView()
    }
}
