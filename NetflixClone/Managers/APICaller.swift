//
//  APICaller.swift
//  NetflixClone
//
//  Created by Şule Kaptan on 6.03.2024.
//

import Foundation

struct Constants {
    static let API_KEY = "2cc35d00bd31bf0df4e98502278a8fbc"
    static let baseURL = "https://api.themoviedb.org"
}


class APICaller {
    //1.adım: singleton nesne yaratmak
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (String) -> ()){
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/all/day?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                print(results)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
}
