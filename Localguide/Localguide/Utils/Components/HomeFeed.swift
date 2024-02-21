//
//  Components.swift
//  Localguide
//
//  Created by Jiami Jongejan on 23/4/2023.
//

import Foundation
import SwiftUI


/*
 Discover category section
 */

struct CategoryIcon: View {
    var categoryName : String
    var categoryImgName : String

    init(name: String, imgName: String) {
        self.categoryName = name
        self.categoryImgName = imgName
    }
    var body: some View{
        Image(systemName: categoryImgName)
            .foregroundColor(LocalguideColor.yellow)
            .frame(width: 50, height: 50)
            .background(LocalguideColor.red)
            .cornerRadius(.infinity)
        Text(categoryName)
            .font(.custom("Nunito-Bold", size: 12))
            .foregroundColor(LocalguideColor.red)
    }
}

/*
 Discover cards section
 */

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(30)
            .shadow(color: Color(red: 0.93, green: 0.93, blue: 0.93), radius: 4, x: 0.0, y: 2)
    }
    
}

struct PlaceCard: View {
    var name: String
    var image: String
    var keywords: [String]
    var rating: String
    var neighbourhood: String
    var ratingInt: Int
    @State var counter = 0
    
    init (name: String, image: String, keywords: [String], rating: String, neighbourhood: String) {
        self.name = name
        self.image = image
        self.keywords = keywords
        self.rating = rating
        self.neighbourhood = neighbourhood
        self.ratingInt = Int(rating) ?? 0
    }
    
    var body: some View {
        HStack(alignment: .center) {
            AsyncImage(url: URL(string: image)){ image in image.resizable()} placeholder: { ProgressView() }
                .frame(width: 150, height: 150)
                .shadow(color: Color(red: 0.93, green: 0.93, blue: 0.93), radius: 4, x: 0.0, y: 2)
            VStack(alignment: .leading) {
                
                Text(name)
                    .font(.custom("Nunito-ExtraBold", size: 20))
                    .foregroundColor(LocalguideColor.darkblue)
                    .padding(.top, 3)
                    .padding(.bottom, 6)
                
                HStack {
                    if self.ratingInt >= 1 {
                        ForEach(1 ... self.ratingInt, id: \.self) { _ in
                            Image(systemName: "star.fill")
                                .foregroundColor(LocalguideColor.darkblue)
                                .font(.custom("Nunito-Bold", size: 8))
                        }
                    }
                }
                .padding(.bottom, 5)
                
                HStack{
                    Image(systemName: "map.fill")
                        .foregroundColor(LocalguideColor.darkblue)
                        .font(.custom("Nunito-Bold", size: 12))
                    Text(neighbourhood)
                        .font(.custom("Nunito-Bold", size: 16))
                        .foregroundColor(LocalguideColor.darkblue)
                }
                
                HStack {
                    HStack{
                        Image(systemName: "fork.knife")
                            .foregroundColor(.white)
                            .font(.custom("Nunito-Bold", size: 12))
                        Text(keywords[0])
                            .foregroundColor(.white)
                            .font(.custom("Nunito-Bold", size: 12))
                    }
                    .padding(4)
                    .background(LocalguideColor.darkblue)
                    .cornerRadius(5)
                    
                    HStack{
                        Image(systemName: "mustache.fill")
                            .foregroundColor(.white)
                            .font(.custom("Nunito-Bold", size: 12))
                        Text(keywords[1])
                            .foregroundColor(.white)
                            .font(.custom("Nunito-Bold", size: 12))
                    }
                    .padding(4)
                    .background(LocalguideColor.darkblue)
                    .cornerRadius(5)
                }
            }
            .padding(5)
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .background(LocalguideColor.lightgreen)
        .modifier(CardModifier())
        .padding(.all, 10)
    }
}
