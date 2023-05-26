//
//  MoviesViewModel.swift
//  MoviesTaller
//
//  Created by Daniel Vargas on 20/02/23.
//

import Foundation
import SwiftUI


final class MoviesVieWModel: ObservableObject{
    
    @Published private var movies : [Movie] = []
    
    
   // func getMovies() async{
     //   guard let moviesUrl = URL(string: "https://api.themoviedb.org/3/movie/550?api_key=03d948fe149e6996c31ec15205f78e5e") else {return}
        
        //Creating url session
       // let (data, _) = try await URLSession.shared.data(from: moviesUrl)
        
        //Convert to JSON
        //let decodedResponse = try? JSONDecoder().decode(Movie.self, from: data)
        
//    }
    
    
}

