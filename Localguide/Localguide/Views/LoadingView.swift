//
//  LoadingView.swift
//  Localguide
//
//  Created by Jiami Jongejan on 23/4/2023.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Image("LaunchscreenImg")
                    .resizable()
                    .scaledToFit()
            }
            Spacer()
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: LocalguideColor.red))
                .scaleEffect(x: 2, y: 2, anchor: .center)
            Spacer()
        }
        .padding(100)
        .background(LocalguideColor.beige)
        
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
