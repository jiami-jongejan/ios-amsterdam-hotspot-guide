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
            LoadingView()
                .onAppear(perform: self.fetchPlaces)
        } else {
            NavigationView{
                VStack{
                    ForEach(places) {place in
                        PlaceCard(name: place.name, image: place.image)
                    }
                }
                .refreshable {
                    self.fetchPlaces()
                }
            }
        }
    }
}

struct HomeFeedView_Previews: PreviewProvider {
    static var previews: some View {
        HomeFeedView()
    }
}
