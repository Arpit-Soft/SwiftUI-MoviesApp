//
//  Webservice.swift
//  MoviesApp
//
//  Created by Arpit Dixit on 08/07/21.
//

import Foundation

let url = "http://www.omdbapi.com/?s=batman&apikey=564727fa"

class Webservice {
    
    func loadMovies(completion: @escaping ([Movie]?) -> ()) {
        
        guard let url = URL(string: url) else {
            fatalError("URL is incorrect")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let moviesResponse = try? JSONDecoder().decode(MoviesResponse.self, from: data)
            
            if let moviesResponse = moviesResponse {
                
                DispatchQueue.main.async {
                    completion(moviesResponse.search)
                }
            }
            
        }.resume()
    }
}
