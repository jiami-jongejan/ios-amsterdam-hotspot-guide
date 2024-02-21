//
//  APIController.swift
//  Localguide
//
//  Created by Jiami Jongejan on 22/4/2023.
//

import Foundation


let API_BASE_URL = "https://hotspot-backend.azurewebsites.net/"

enum AppStatus: String {
    case loading = "loading"
    case login = "login"
    case onboarding = "onboarding"
    case ready = "ready"
}

class LocalguideBackend: ObservableObject{
    @Published var places: [Place]  = []
    @Published var status: AppStatus
    @Published var loadingPlaces: Bool = true
    
    init() {
        self.status = AppStatus.loading
    }
    
    @Sendable func apiRequest(req: URLRequest, onDone: @escaping (_: Bool, _: Data?) -> Void) {
        let task = URLSession.shared.dataTask(with: req) { data, response,
            error in
            if error != nil {
                print("error")
                onDone(false, nil)
                return
            }
            guard let httpResponse =  response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                DispatchQueue.main.async {
                    print(response ?? "")
                    print("error")
                }
                onDone(false, nil)
                return
            }
            onDone(true, data)
        }
        task.resume()
    }
    
    @Sendable func loadPlaces(completed: Bool, onDone: @escaping (_: Bool, _: [Place]?) -> Void) {
        let url = URL(string: API_BASE_URL + "getAll")!
        let request = URLRequest(url: url)
        
        self.apiRequest(req: request) { (success, data) in
            if (success) {
                do {
                    let res = try JSONDecoder().decode([Place].self, from: data!)
                    onDone(true, res)
                    print(res)
                } catch {
                    onDone(false, nil)
                    print("Unexpected error: \(error).")
                }
            }
        }
    }
}
