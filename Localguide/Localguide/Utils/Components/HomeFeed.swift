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

    init(name: String) {
        self.categoryName = name
    }
    var body: some View{
        Image(systemName: IconMapper.iconName(forCategory: categoryName))
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
    var id: Int
    var name: String
    var image: String
    var keywords: [String]
    var rating: String
    var neighbourhood: String
    var ratingInt: Int
    
    init (id: String, name: String, image: String, keywords: [String], rating: String, neighbourhood: String) {
        self.id = Int(id) ?? 0
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
                
                RatingBlock(rating: ratingInt, fontSize: 8)
                
                HStack{
                    Image(systemName: "map.fill")
                        .foregroundColor(LocalguideColor.darkblue)
                        .font(.custom("Nunito-Bold", size: 12))
                    Text(neighbourhood)
                        .font(.custom("Nunito-Bold", size: 16))
                        .foregroundColor(LocalguideColor.darkblue)
                }
                
                KeywordsBlock(keywords: keywords, fontSize: 12)
            }
            .padding(5)
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .background(id % 2 == 0 ? LocalguideColor.lightgreen : LocalguideColor.lightblue)
        .modifier(CardModifier())
        .padding(.all, 10)
    }
}
