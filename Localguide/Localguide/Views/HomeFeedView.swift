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
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Nunito-Bold", size: 20)!]
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
                        .padding(.horizontal)
                        .padding(.bottom, 10)

                        DiscoverCategoriesView()
                        
                        VStack {
                            RecommendationCardsView(arg: places)
                            DiscoverCardsView(arg: places)
                        }
                        .padding(.top, 10)
                        .background(Color.white)
                        .cornerRadius(40)
                        .padding(.top, 10)
                    }
                    
                }
                .refreshable { self.fetchPlaces() }
                .navigationBarTitle(Text("Discover").font(.subheadline), displayMode: .large)
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
                    .font(.custom("Nunito-ExtraBold", size: 20))
                    .foregroundColor(LocalguideColor.darkblue)
                Spacer()
            }.padding(.horizontal)
            .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 16){
                    ForEach(cards) { place in
                        VStack(spacing: 8){
                            ZStack{
                                AsyncImage(url: URL(string: place.image)){ image in image.resizable()} placeholder: { ProgressView() }
                                    .frame(width: 230, height: 200)
                            }
                                .cornerRadius(30)
                                .shadow(color: Color(red: 0.89, green: 0.89, blue: 0.89), radius: 4, x: 0.0, y: 2)
                            Text(place.name)
                                .font(.custom("Nunito-Bold", size: 16))
                                .foregroundColor(LocalguideColor.darkblue)
                        }
                    }
                }.padding(.horizontal)
                    .padding(.bottom, 20)
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
                    PlaceCard(name: place.name, image: place.image, keywords: place.keywords, rating: place.rating, neighbourhood: place.neighbourhood)
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
                }
                .padding(.horizontal)
                .padding(.top, 5)
                .padding(.bottom, 10)
            }
}
    
struct HomeFeedView_Previews: PreviewProvider {
    static var previews: some View {
        HomeFeedView()
            .environmentObject(LocalguideBackend())
        }
    }
}
