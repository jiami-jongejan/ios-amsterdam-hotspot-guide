//
//  HomeFeedView.swift
//  Localguide
//
//  Created by Jiami Jongejan on 22/4/2023.
//

import Foundation
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
                ZStack {
                    
                    Image("HomeBg")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                    
                    ScrollView{
                        HStack{
                            Image(systemName: "magnifyingglass")
                            Text("Where do you want to go?")
                            Spacer()
                        }
                        .font(.custom("Nunito-Bold", size: 14))
                        .foregroundColor(LocalguideColor.darkblue)
                        .padding()
                        .background(Color.black.opacity(0.1))
                        .cornerRadius(20)
                        .padding(10)

                        DiscoverCategoriesView()
                        VStack {
                            RecommendationCardsView(arg: places)
                            DiscoverCardsView(arg: places)
                        }
                        .background(Color.white)
                        .cornerRadius(20)
                        .padding(.top, 40)
                    }
                    
                }
                .refreshable { self.fetchPlaces() }
                .navigationTitle("Discover")
            }
        }
    }
}

struct RecommendationCardsView: View {
        var cards : [Place]
    
        init(arg: [Place]) {
            self.cards = arg
        }
    
        var body: some View {
            HStack() {
                Text("Our recommendations")
                    .font(.custom("Nunito-Bold", size: 16))
                    .foregroundColor(LocalguideColor.darkblue)
                Spacer()
            }.padding(.horizontal)
            .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 16){
                    ForEach(cards) { place in
                        VStack(spacing: 8){
                            Spacer()
                                .frame(width: 130, height: 150)
                                .background(LocalguideColor.yellow)
                                .cornerRadius(20)
                                .padding(.bottom)
                        }
                    }
                }.padding(.horizontal)
            }
        }
}


struct DiscoverCardsView: View {
        var cards : [Place]
    
        init(arg: [Place]) {
            self.cards = arg
        }
    
        var body: some View {
            VStack{
                ForEach(cards) {place in
                    PlaceCard(name: place.name, image: place.image)
                }
            }
        }
}

struct DiscoverCategoriesView: View {
    let categories: [Category] = [
        .init(name: "Restaurant", imgName: "fork.knife"),
        .init(name: "Bar", imgName: "wineglass.fill"),
        .init(name: "Coffee", imgName: "cup.and.saucer.fill"),
        .init(name: "Party", imgName: "party.popper.fill"),
        .init(name: "Outdoor", imgName: "sun.min.fill"),
        .init(name: "Fancy", imgName: "wand.and.stars"),
        .init(name: "Hipster", imgName: "mustache.fill")
    ]
        
    var body: some View {
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 16){
                    ForEach(categories, id: \.self) { category in
                        VStack(spacing: 4){
                            CategoryIcon(name: category.name, imgName: category.imgName)
                        }
                    }
                }.padding(.horizontal)
            }
}
    
struct HomeFeedView_Previews: PreviewProvider {
    static var previews: some View {
        HomeFeedView()
            .environmentObject(LocalguideBackend())
        }
    }
}
