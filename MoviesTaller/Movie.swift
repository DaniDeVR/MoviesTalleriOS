//
//  Movie.swift
//  MoviesTaller
//
//  Created by Daniel Vargas on 20/02/23.
//

import Foundation

struct Movie : Identifiable,Decodable
{
    let id : Int
    let title : String
    let release_date : String
}
