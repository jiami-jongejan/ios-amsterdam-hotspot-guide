//
//  KeywordsBlock.swift
//  Localguide
//
//  Created by Jiami Jongejan on 23/2/2024.
//

import Foundation
import SwiftUI

struct KeywordsBlock: View {
    var fontSize: CGFloat
    var keywords: [String]
    
    init(keywords: [String], fontSize: CGFloat) {
        self.keywords = keywords
        self.fontSize = fontSize
    }
    
    var body: some View {
        HStack {
            HStack{
                Image(systemName: "fork.knife")
                    .foregroundColor(.white)
                    .font(.custom("Nunito-Bold", size: fontSize))
                Text(keywords[0])
                    .foregroundColor(.white)
                    .font(.custom("Nunito-Bold", size: fontSize))
            }
            .padding(4)
            .background(LocalguideColor.darkblue)
            .cornerRadius(5)
            
            HStack{
                Image(systemName: "mustache.fill")
                    .foregroundColor(.white)
                    .font(.custom("Nunito-Bold", size: fontSize))
                Text(keywords[1])
                    .foregroundColor(.white)
                    .font(.custom("Nunito-Bold", size: fontSize))
            }
            .padding(4)
            .background(LocalguideColor.darkblue)
            .cornerRadius(5)
        }
        .padding(.horizontal)
    }
}
