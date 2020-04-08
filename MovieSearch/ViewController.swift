//
//  ViewController.swift
//  MovieSearch
//
//  Created by William Trahan on 4/5/20.
//  Copyright © 2020 Wil Trahan. All rights reserved.
//

import AVFoundation
import AVKit
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
//    let queryService = QueryService()
    
    var movies: [Movie] = []
    let searchController = UISearchController(searchResultsController: nil)
    var filteredMovies: [Movie] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movies = Movie.movies()
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Movies"
        tableView.tableHeaderView = searchController.searchBar
        definesPresentationContext = true
    }
    
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("User has tapped on cell \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredMovies.count
        }
        return movies.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell")! as! MovieCell
        
        let movie: Movie
        if isFiltering {
            movie = filteredMovies[indexPath.row]
        } else {
            movie = movies[indexPath.row]
        }
        
        cell.movieTitleView?.text = movie.title
        cell.movieDateView?.text = movie.release_date
        
        return cell
    }
    
    
    
    func filterContentForSearchText(_ searchText: String) {
        filteredMovies = movies.filter { (movie: Movie) -> Bool in
            return movie.title.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
    
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
//        queryService.getSearchResults(searchTerm: searchBar.text!)

    }
}

//extension ViewController: UISearchBarDelegate {
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
////        dismissKeyboard()
//
//        guard let searchText = searchBar.text, !searchText.isEmpty else {
//            return
//        }
//
//        UIApplication.shared.isNetworkActivityIndicatorVisible = true
//
//        queryService.getSearchResults(searchTerm: searchText) { [weak self] results, errorMessage in
//            UIApplication.shared.isNetworkActivityIndicatorVisible = false
//
//            if let results = results {
//                self?.searchResults = results
//                self?.tableView.reloadData()
//                self?.tableView.setContentOffset(CGPoint.zero, animated: false)
//            }
//
//            if !errorMessage.isEmpty {
//                print("Search error: " + errorMessage)
//            }
//        }
//    }

//    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//        view.addGestureRecognizer(tapRecognizer)
//    }
//
//    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
//        view.removeGestureRecognizer(tapRecognizer)
//    }
//}


