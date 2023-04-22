//
//  APICaller.swift
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

let BACKEND_BASE_URL = "http://localhost:3000/api/"

struct Hotspot:Codable{
    let _id: String
    let name: String
    let description: String
    let image: String
    let keywords: Array<String>
    let neighbourhood: String
    let coordinates: Array<Float>
}

func getPost() {
    callAPI()
    decodeAPI()
}

/* Method that calls all posts from the localhost.
 */
func callAPI(){
    guard let url = URL(string: BACKEND_BASE_URL + "getOne/6443f51c5df7c8b884fc1baf")
    else {
        return
    }
    let task = URLSession.shared.dataTask(with: url){
        data, response, error in
        
        if let data = data, let string = String(data: data, encoding: .utf8){
            print(string)
        }
    }

    task.resume()
}

/* Method that calls all posts
 */
func decodeAPI(){
    guard let url = URL(string: BACKEND_BASE_URL + "getAll/")
    else {
        return
    }

    let task = URLSession.shared.dataTask(with: url){
        data, response, error in
        
        let decoder = JSONDecoder()

        if let data = data{
            do{
                let tasks = try decoder.decode([Hotspot].self, from: data)
                tasks.forEach{ i in
                    print(i)
                }
            }catch{
                print(error)
            }
        }
    }
    task.resume()

}
