//
//  APIController.swift
//  Localguide
//
//  Created by Jiami Jongejan on 22/4/2023.
//

/*
 The current API is uploaded on a local server. This server is created using Nodejs, MangoDB and Express. If you would like to run this localhost on your own server, please check the Github below which has all the code to setup the correct route and models on your local server.
 https://github.com/jiami-jongejan/rest-api
 
 
 Visit the following Postman to see all the possible POST, GET, PATCH and DELETE requests.
 https://www.postman.com/cloudy-shuttle-469413/workspace/localguide/collection/11424816-580f89dc-9bd9-40c2-8319-d44eaef01f56?action=share&creator=11424816
 */

import Foundation


let API_BASE_URL = "http://localhost:3000/api/"

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
        let url = URL(string: API_BASE_URL + "getAll/")!
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
