//
//  MovieResponce.swift
//  MovieRating
//
//  Created by Kamila Lech on 15/01/2022.
//

import Foundation


struct SearchResponse: Codable {
    var Search:[MovieResponce]?
}

struct MovieResponce : Codable {
    var Title : String?
    var Year : String?
    var imdbID: String?
    var Poster: String?
    var MovieType:String?
    
    enum CodingKeys: String, CodingKey {
        case MovieType = "Type"
        case Title
        case Year
        case imdbID
        case Poster
    }
    
}

struct IMDBResponce : Codable {
    var Title : String?
    var year : String?
    var rated: String?
    var released : String?
    var runtime : String?
    var genre : String?
    var director : String?
    var writer : String?
    var actors : String?
    var plot : String?
    var language : String?
    var country : String?
    var awards : String?
    var poster : String?
    var ratings : [String]?
    var metascore : String?
    var imdbRating : String?
    var imdbVotes : String?
    var imdbID : String?
    var dvd : String?
    var boxOffice : String?
    var production : String?
    var website : String?
    var response : String?
   }
    

