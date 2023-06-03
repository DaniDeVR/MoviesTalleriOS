//
//  FavoritesView.swift
//  MoviesTaller
//
//  Created by Daniel Vargas on 30/01/23.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var moviesViewModel : MoviesViewModel
    var body: some View {
        NavigationView{
            if moviesViewModel.showFavoriteMovies{
                List(moviesViewModel.favoriteMovies)
                { movie in MovieView(movieType: movie)
                }.padding(.top,20)
                    .navigationBarTitle(Text("Tus Favoritas"),displayMode: .large)
                    .listStyle(.plain)
            }
            else
            {
                Text("No tienes peliculas favoritas por el momento").multilineTextAlignment(.center).foregroundColor(.pink).fontWeight(.bold)
            }
            
        }
        
    }



//struct FavoritesView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoritesView()
//    }
}
