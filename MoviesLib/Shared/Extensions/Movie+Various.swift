//
//  Movie+Various.swift
//  MoviesLib
//
//  Created by Bruno Oliveira on 02/09/22.
//

import Foundation


extension Movie {
    var ratingFormatted: String{
        "⭐️ \(rating)/10"
    }
    
    var imageSmall: String {
        "\(String(describing: image))small"
    }
}
