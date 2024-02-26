//
//  RatingBlock.swift
//  Localguide
//
//  Created by Jiami Jongejan on 23/2/2024.
//

import Foundation
import SwiftUI

struct RatingBlock: View {
    var rating: Int
    var fontSize: CGFloat
    
    init (rating: Int, fontSize: CGFloat) {
        self.rating = rating
        self.fontSize = fontSize
    }
    
    var body: some View {
        HStack {
            if self.rating >= 1 {
                ForEach(1 ... self.rating, id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .foregroundColor(LocalguideColor.darkblue)
                        .font(.custom("Nunito-Bold", size: fontSize))
                }
            }
        }
        .padding(.horizontal)
    }
}
