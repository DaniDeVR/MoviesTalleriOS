//
//  MoviesTabView.swift
//  MoviesTaller
//
//  Created by Daniel Vargas on 30/01/23.
//

import SwiftUI

struct MoviesTabView: View {
    @StateObject var moviesViewModel = MoviesViewModel()
    @State var selectedTab : Int = 0
    var body: some View {
        TabView (selection : $selectedTab)
        {
            RecommendedView()
                .environmentObject(moviesViewModel)
//                .badge("")
                .tabItem{
                Image(systemName: "popcorn")
                Text("All Movies")
            }.environment(\.symbolVariants, .circle)
            
            FavoritesView()
                .environmentObject(moviesViewModel)
                .tabItem{
                Label("Favorites",systemImage: "bolt.heart")
                    .environment(\.symbolVariants, .none)
            }
        }.tint(.pink)
    }
}

struct MoviesTabView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesTabView()
    }
}
