//
//  HomeFeedController.swift
//  Localguide
//
//  Created by Jiami Jongejan on 23/4/2023.
//

import Foundation

extension HomeFeedView {
    var backend: LocalguideBackend = LocalguideBackend()
    private var places: [Place]  = []
    private var loadingPlaces: Bool = true
    
    mutating func fetchPlaces(){
        self.backend.loadPlaces(completed: false) { (success, data) in
            DispatchQueue.main.async {
                self.places = data!
                self.loadingPlaces = false
            }
        }
    }
}
