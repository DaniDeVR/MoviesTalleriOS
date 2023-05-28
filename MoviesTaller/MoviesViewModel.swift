import Foundation
import SwiftUI


struct ApiResult : Codable
{
    let results : [Movie]
}

final class MoviesViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    let urlString = "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1"
    let headers = [
        "accept": "application/json",
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwM2Q5NDhmZTE0OWU2OTk2YzMxZWMxNTIwNWY3OGU1ZSIsInN1YiI6IjYzOGUyZjAwOWFlNjEzMDA5ZmQzNzYxZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.gIanj6XG4EUhwdXfzci9o_K5uoF_c7hurlaQ60iTQzA"
    ]
    
    func fetchPopularMovies() {
        
        let session = URLSession.shared
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let dataTask = session.dataTask(with: request) { [weak self] (data, response, error) in
            if let responseError = error {
                print(responseError)
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print(httpResponse)
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let apiResult = try decoder.decode(ApiResult.self, from: data)
                    
                    DispatchQueue.main.sync {
                        self?.movies = apiResult.results
                        print (self?.movies)
                    }
                } catch {
                    print ("Error parseando la data mi bro")
                }
            }
        }
        dataTask.resume()
    }
}
