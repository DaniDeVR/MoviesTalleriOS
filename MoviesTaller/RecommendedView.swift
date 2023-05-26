//
//  ContentView.swift
//  MoviesTaller
//
//  Created by Daniel Vargas on 28/01/23.
//

import SwiftUI
import UIKit

struct RecommendedView: View {
    init() {
        let appereance = UINavigationBarAppearance()
        appereance.titleTextAttributes = [.foregroundColor : UIColor.systemBackground, .font : UIFont.monospacedDigitSystemFont(ofSize: 16, weight: .bold)]
        appereance.largeTitleTextAttributes = [.foregroundColor : UIColor.systemBackground, .font : UIFont.monospacedDigitSystemFont(ofSize: 26, weight: .black)]
        appereance.backgroundColor = UIColor.systemPink
        
        UINavigationBar.appearance().standardAppearance = appereance
        UINavigationBar.appearance().compactAppearance = appereance
        UINavigationBar.appearance().scrollEdgeAppearance = appereance
        UINavigationBar.appearance().tintColor = UIColor.systemBackground
    }
    var body: some View {
        
        NavigationView{
            List(0..<20)
            {movie in 
                MovieView()
            }.padding(.top,20)
            .navigationBarTitle(Text("Recomendaciones para ti"),displayMode: .large)
            .listStyle(.plain)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedView()
    }
}
