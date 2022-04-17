//
//  NetworkService.swift
//  RickAndMorty
//
//  Created by Egor Efimenko on 14.04.2022.
//

import Foundation

class ApiManager {
    
    static let shared = ApiManager()
    var baseUrl = "https://rickandmortyapi.com/api/character"
    
    func getInfo(completion: @escaping (RickAndMorty) -> Void) {
        var request = URLRequest(url: URL(string: self.baseUrl)!)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let result = try? JSONDecoder().decode(RickAndMorty.self, from: data) {
                DispatchQueue.main.async {
                    completion(result)
                }
            }
        }
        task.resume()
    }
}
