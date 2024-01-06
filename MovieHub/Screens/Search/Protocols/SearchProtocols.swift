//
//  Protocols.swift
//  MovieHub
//
//  Created by sidzhe on 25.12.2023.
//

import Foundation

/// PRESENTER -> VIEW
protocol SearchViewProtocol: AnyObject {
    var presenter: SearchPresenterProtocol? { get set }
    func updateUI()
}

/// VIEW -> PRESENTER
protocol SearchPresenterProtocol: AnyObject {
    var view: SearchViewProtocol? { get set }
   
    func getUpcomingMovie() -> [UpcomingDoc]
    func getRecentMovie() -> [Doc]
    func getSearchData() -> [Doc]
    func getCategories() -> [String]
    
    func fetchUpcomingMovie(with genre: String)
    func fetchSearchedMovie(with searchText: String) 
}

/// PRESENTER -> INTERACTOR
protocol SearchInteractorInputProtocol: AnyObject {
    var presenter: SearchInteractorOutputProtocol? { get set }
    
    var categories: [String] { get }
    
    var searchMovie: SearchModel? { get }
    var upcomingMovie: UpcomingModel? { get }
    var recentMovie: [Doc] { get }
    
    func requestSearch(_ title: String)
    func requestUpcomingMovie(category: MovieGenre)
}

/// INTERACTOR -> PRESENTER
protocol SearchInteractorOutputProtocol: AnyObject {
    func updateUI()
}

/// PRESENTER -> ROUTER
protocol SearchRouterProtocol: AnyObject {
    
}
