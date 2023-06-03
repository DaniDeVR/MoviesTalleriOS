import Foundation
import SwiftUI


struct ApiResult : Codable
{
    let results : [Movie]
}

final class MoviesViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var favoriteMovies: [Movie] = []
    @Published var showFavoriteMovies = false
    let urlString = "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1"
    let headers = [
        "accept": "application/json",
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwM2Q5NDhmZTE0OWU2OTk2YzMxZWMxNTIwNWY3OGU1ZSIsInN1YiI6IjYzOGUyZjAwOWFlNjEzMDA5ZmQzNzYxZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.gIanj6XG4EUhwdXfzci9o_K5uoF_c7hurlaQ60iTQzA"
    ]
    
    init() {
        if let savedMovies = UserDefaults.standard.data(forKey: "SavedMovies")
        {
            if let decoded = try? JSONDecoder().decode([Movie].self, from: savedMovies)
            {
                favoriteMovies = decoded
                updateShowFavoriteMovies()
                return
            }
        }
    }
    
    func updateShowFavoriteMovies()
    {
        showFavoriteMovies = !favoriteMovies.isEmpty
        
    }
    
    
    func toggleFavorite (movie: Movie)
    {
        if favoriteMovies.contains(where: {$0.id == movie.id})
        {
            favoriteMovies.removeAll{$0.id == movie.id}
        }
        else
        {
            favoriteMovies.append(movie)
        }
        updateShowFavoriteMovies()
        saveFavoriteMovies()
    }
    
    func fetchPopularMovies() {
        
        let session = URLSession.shared
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let dataTask = session.dataTask(with: request) { [weak self] (data, response, error) in
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let apiResult = try decoder.decode(ApiResult.self, from: data)
                    
                    DispatchQueue.main.sync {
                        self?.movies = apiResult.results
                        print (self?.movies)
                    }
                } catch {
                }
            }
            
            if let error = error {
                print(error)
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print(httpResponse)
            }
            
         
        }
        dataTask.resume()
    }

    func saveFavoriteMovies()
    {
        if let encoded = try? JSONEncoder().encode(favoriteMovies)
        {
            UserDefaults.standard.set(encoded, forKey: "SavedMovies")
        }

        
    }
}
