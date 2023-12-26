//
//  NetwrorkService.swift
//  MovieHub
//
//  Created by sidzhe on 25.12.2023.
//

import UIKit

//MARK: - NetworkServiceProtool
protocol NetworkServiceProtool: AnyObject {
    func searchTitle<T: Decodable>(_ title: String, completion: @escaping (Result<T, RequestError>) -> Void)
    func searchPerson<T: Decodable>(_ person: String, completion: @escaping (Result<T, RequestError>) -> Void)
    func searchID<T: Decodable>(_ identifier: String, completion: @escaping (Result<T, RequestError>) -> Void)
    func searchColletions<T: Decodable>(completion: @escaping (Result<T, RequestError>) -> Void)
    func getSlugCollection<T: Decodable>(slugTag: String, completion: @escaping (Result<T, RequestError>) -> Void)
    func getGenreCollection<T: Decodable>(genre: MovieGenre, completion: @escaping (Result<T, RequestError>) -> Void)
    func getRateCollection<T: Decodable>(completion: @escaping (Result<T, RequestError>) -> Void)
    func getMovieWithPerson<T: Decodable>(personId: [Int], completion: @escaping (Result<T, RequestError>) -> Void)
    func loadImage(_ urlString: String?, completion: @escaping (Result<UIImage, RequestError>) -> Void)
}


//MARK: - NetworkkService
final class NetworkkService: NetworkServiceProtool {
    
    //MARK: Properties
    private let movieService = MovieService()
    
    //MARK: Search with title
    func searchTitle<T: Decodable>(_ title: String, completion: @escaping (Result<T, RequestError>) -> Void) {
        Task {
            let result: Result<T, RequestError> = await movieService.searchMovie(searchTitle: title)
            completion(result)
        }
    }
    
    //MARK: Search with person
    func searchPerson<T: Decodable>(_ person: String, completion: @escaping (Result<T, RequestError>) -> Void) {
        Task {
            let result: Result<T, RequestError> = await movieService.searchPerson(person: person)
            completion(result)
        }
    }
    
    //MARK: Search with ID
    func searchID<T: Decodable>(_ identifier: String, completion: @escaping (Result<T, RequestError>) -> Void) {
        Task {
            let result: Result<T, RequestError> = await movieService.searchWithId(identifier: identifier)
            completion(result)
        }
    }
    
    //MARK: Get collections
    func searchColletions<T: Decodable>(completion: @escaping (Result<T, RequestError>) -> Void) {
        Task {
            let result: Result<T, RequestError> = await movieService.searchCollection()
            completion(result)
        }
    }
    
    //MARK: Get Movie with slug
    func getSlugCollection<T: Decodable>(slugTag: String, completion: @escaping (Result<T, RequestError>) -> Void) {
        Task {
            let result: Result<T, RequestError> = await movieService.movieFilterSlug(slugTag: slugTag)
            completion(result)
        }
    }
    
    //MARK: Get Movie with genre
    func getGenreCollection<T: Decodable>(genre: MovieGenre, completion: @escaping (Result<T, RequestError>) -> Void) {
        Task {
            let result: Result<T, RequestError> = await movieService.movieFilterGenres(genre: genre.rawValue)
            completion(result)
        }
    }
    
    //MARK: Get rate movies
    func getRateCollection<T: Decodable>(completion: @escaping (Result<T, RequestError>) -> Void) {
        Task {
            let result: Result<T, RequestError> = await movieService.movieFilterRate()
            completion(result)
        }
    }
    
    //MARK: Movie related person
    func getMovieWithPerson<T: Decodable>(personId: [Int], completion: @escaping (Result<T, RequestError>) -> Void) {
        Task {
            let result: Result<T, RequestError> = await movieService.movieFilterPerson(actorsId: personId)
            completion(result)
        }
    }
    
    //MARK: Load image
    func loadImage(_ urlString: String?, completion: @escaping (Result<UIImage, RequestError>) -> Void) {
        Task {
            let result: Result<UIImage, RequestError> = await movieService.loadImage(urlString)
            completion(result)
        }
    }
}