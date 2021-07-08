//
//  URLImage.swift
//  MoviesApp
//
//  Created by Arpit Dixit on 08/07/21.
//

import SwiftUI

struct URLImage: View {
    
    let placeholder: String
    
    @ObservedObject var imageLoader = ImageLoader()
    
    init(url: String, placeholder: String = "placeholder") {
        self.placeholder = placeholder
        imageLoader.downloadImage(url: url)
    }
    
    var body: some View {
        if let data = imageLoader.downloadedData {
            Image(uiImage: UIImage(data: data)!).resizable()
        }
        else {
            Image(self.placeholder).resizable()
        }
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: "https://m.media-amazon.com/images/M/MV5BOTY4YjI2N2MtYmFlMC00ZjcyLTg3YjEtMDQyM2ZjYzQ5YWFkXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg")
    }
}
