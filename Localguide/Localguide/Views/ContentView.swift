//
//  ContentView.swift
//  Localguide
//
//  Created by Jiami Jongejan on 22/4/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var backend: LocalguideBackend = LocalguideBackend()

    var body: some View {
        TabView {
            HomeFeedView().tabItem {
                Image(systemName: "house.fill")
                    .foregroundColor(LocalguideColor.red)
            }
            FullMapView().tabItem {
                Image(systemName: "map.fill")
            }
            HomeFeedView().tabItem {
                Image(systemName: "magnifyingglass")
            }
            HomeFeedView().tabItem {
                Image(systemName: "heart.fill")
            }
            .environmentObject(backend)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
    ContentView()
//        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .environmentObject(LocalguideBackend())
    }
}
