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
//        Spacer()
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
            .cornerRadius(20)
    }
    
}

struct PlaceCard: View {
    var name: String
    var image: String
    
    var body: some View {
        HStack(alignment: .center) {
            AsyncImage(url: URL(string: image)){ image in image.resizable()} placeholder: { ProgressView() }
                .frame(width: 120, height: 120)
            VStack(alignment: .leading) {
                Text(name)
                    .font(.system(size: 22, weight: .bold, design: .default))
                    .foregroundColor(.white)
                Text("test")
                    .font(.system(size: 16, weight: .bold, design: .default))
                    .foregroundColor(.gray)
                HStack {
                    Text("$" + String.init(format: "%0.2f", "test"))
                        .font(.system(size: 16, weight: .bold, design: .default))
                        .foregroundColor(.white)
                        .padding(.top, 8)
                }
            }.padding(.trailing, 20)
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .background(LocalguideColor.red)
        .modifier(CardModifier())
        .padding(.all, 10)
    }
}
