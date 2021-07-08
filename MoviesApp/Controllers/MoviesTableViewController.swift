//
//  MoviesTableViewController.swift
//  MoviesApp
//
//  Created by Arpit Dixit on 08/07/21.
//

import UIKit
import SwiftUI

class MoviesTableViewController: UITableViewController {
    
    private var movies: [Movie] = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateMovies()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @IBSegueAction func showMoviesDetailSegue(_ coder: NSCoder) -> UIViewController? {
        guard let selectedIndex = tableView.indexPathForSelectedRow else {
            fatalError("No index is selected")
        }
        return UIHostingController(coder: coder, rootView: MoviesDetailView(movie: movies[selectedIndex.row]))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let movie = self.movies[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesTableViewCell", for: indexPath)
        
        cell.textLabel?.text = movie.title
        
        DispatchQueue.global().async {
            let imageData = try? Data(contentsOf: URL(string: movie.poster)!)
            if let imageData = imageData {
                DispatchQueue.main.async {
                    cell.imageView?.image = UIImage(data: imageData)
                }
            }
        }
        
        return cell
    }
    
    private func populateMovies() {
        
        Webservice().loadMovies() { movies in
            
            if let movies = movies {
                self.movies = movies
                self.tableView.reloadData()
            }
            
        }
        
    }
    
}
