//
//  MovieView.swift
//  MoviesTaller
//
//  Created by Daniel Vargas on 1/02/23.
//

import SwiftUI

struct MovieView: View {
    @State private var isMovieLiked = false
    var body: some View {
        HStack (spacing: 10){
            Image("wakanda").resizable().scaledToFit().frame(height: 70).cornerRadius(5)
            VStack(alignment: .leading, spacing: 10){
                Text("Wakanda Forever").fontWeight(.bold).foregroundColor(.pink)
                VStack(alignment: .leading, spacing: 4){
                Text("Fecha de estreno")
                    Text("1 enero 2022").foregroundColor(.secondary)}
                
            }
            Image(systemName: isMovieLiked ? "heart.fill" : "suit.heart" )
                .font(.title2)
                .foregroundColor(.pink)
                .scaleEffect(isMovieLiked ? 1.18 : 1.0)
                .animation(.spring())
                .onTapGesture {
                    withAnimation{
                    isMovieLiked.toggle()}
                }
        }
        
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView()
    }
}
