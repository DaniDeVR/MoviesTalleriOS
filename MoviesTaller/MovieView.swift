//
//  MovieView.swift
//  MoviesTaller
//
//  Created by Daniel Vargas on 1/02/23.
//

import SwiftUI

struct MovieView: View {
    @EnvironmentObject var moviesViewModel : MoviesViewModel
    @State private var isMovieLiked = false
    
    
    let movieType: Movie
    let baseURL = "https://image.tmdb.org/t/p/original"
    let imageURL: URL
       
    init(movieType: Movie) {
        self.movieType = movieType
        let movieImageUrl = baseURL + movieType.poster_path
        self.imageURL = URL(string: movieImageUrl)!
    }
    var body: some View {
        HStack (spacing: 10){
            
            AsyncImage(url: imageURL, content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 100)
                    .cornerRadius(5)
                
            }  ,placeholder: {
                ProgressView()
            })
            VStack(alignment: .leading, spacing: 10){
                Text(movieType.title).fontWeight(.bold).foregroundColor(.pink)
                VStack(alignment: .leading, spacing: 4){
                    Text("Fecha de estreno")
                    Text(movieType.release_date).foregroundColor(.secondary)}
                
            }
            Image(systemName: moviesViewModel.favoriteMovies.contains(where: {$0.id == movieType.id}) ? "heart.fill" : "suit.heart" )
                .font(.title2)
                .foregroundColor(.pink)
                .scaleEffect(isMovieLiked ? 1.18 : 1.0)
                .onTapGesture {
                    withAnimation{
                        isMovieLiked.toggle()
                        moviesViewModel.toggleFavorite(movie: movieType)
                    }
                }
        }
        
    }

}

//struct MovieView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieView(movieType: <#Movie#>)
//    }
//}
