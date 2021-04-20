//
//  Injector.swift
//  GitHubRepositories
//
//  Created by Ramy Nasser on 4/20/21.
//  Copyright © 2021 Ramy Nasser. All rights reserved.
//

/**
 this class is to make Dependency injectionn to handle unit test
 */
import Foundation
public class Injector {
    public static var shared: Injector = Injector()

//    func provideMoviePresenter() -> MoviePresenter {
//        return MoviePresenter(movieService: Injector.shared.provideMovieGateway(), coreDataMoviesGateway: Injector.shared.provideAddMovieGateway())
//    }
//
//    func provideMovieGateway() -> MovieGateway {
//        return MovieGateway()
//    }
//
//    func provideAddMoviePresenter() -> AddMoviePresenter {
//        return AddMoviePresenter(coreDataMoviesGateway: Injector.shared.provideAddMovieGateway())
//    }
//
//    func provideAddMovieGateway() -> CoreDataMoviesGateway {
//        let viewContext = CoreDataStackImplementation.shared
//        let coreDataBooksGateway = CoreDataMoviesGateway(viewContext: viewContext)
//        return coreDataBooksGateway
//    }
}
