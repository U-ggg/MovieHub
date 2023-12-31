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
}

/// VIEW -> PRESENTER
protocol SearchPresenterProtocol: AnyObject {
    var view: SearchViewProtocol? { get set }
    var searchSections: [SearchSection] { get }
    func getCategories() -> [SearchCategoryModel]
    func getRecentMovie() -> [Doc]
    func getSearchData() -> [Doc]
    func selectedCategory(_ index: Int, genre: MovieGenre)
}

/// PRESENTER -> INTERACTOR
protocol SearchInteractorInputProtocol: AnyObject {
    var presenter: SearchInteractorOutputProtocol? { get set }
    var searchMovie: SearchModel? { get }
    var searchCategoriesData: [SearchCategoryModel] { get }
    func requestSearch(_ title: String)
    func selectedCategory(_ index: Int)
}

/// INTERACTOR -> PRESENTER
protocol SearchInteractorOutputProtocol: AnyObject {
    
}

/// PRESENTER -> ROUTER
protocol SearchRouterProtocol: AnyObject {
    
}
