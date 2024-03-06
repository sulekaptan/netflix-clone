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

enum APIError: Error {
    case failedToGetData
}

class APICaller {
    //1.adım: singleton nesne yaratmak
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> ()){
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getTrendingTvs(completion: @escaping (Result<[Tv], Error>) -> ()) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTvResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getUpcomingMovies(completion: @escaping (Result<[Movie], Error>) -> ()){
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let results = try JSONDecoder().decode(UpcomingMovieResponse.self, from: data)
                completion(.success(results.results))
                print(results)
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getPopular(completion: @escaping (Result<[Movie], Error>) -> ()){
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let results = try JSONDecoder().decode(PopularMovieResponse.self, from: data)
                completion(.success(results.results))
                print(results)
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getTopRated(completion: @escaping (Result<[Movie], Error>) -> ()){
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let results = try JSONDecoder().decode(topRatedMovieResponse.self, from: data)
                completion(.success(results.results))
                print(results)
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }

}


