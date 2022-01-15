//
//  ViewController.swift
//  MovieRating
//
//  Created by Akib Quraishi on 15/01/2022.
//

import UIKit

class MovieRatingViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  
private let movieCellIdenifier = "MovieCell"
   
    var movies = [MovieResponce]()
    
   let movieCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        movieCollectionView.register(MovieCell.self, forCellWithReuseIdentifier: movieCellIdenifier)
       
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
        movieCollectionView.backgroundColor = .purple
     
        view.addSubview(movieCollectionView)
        
        getMovies(searchTxt: "batman")
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        movieCollectionView.frame = view.bounds
    }
    
    
    func getMovies(searchTxt:String) {
        
        let base_URL = "https://www.omdbapi.com/?s=\(searchTxt)&apikey=28d24f30"
        
        let networkManager = NetworkService()
        
       
            networkManager.fetchRequest(urlString: base_URL, httpMethod: .get, json: nil) { (result:Result<SearchResponse, Error>) in
                
                switch result {
                
                case .failure(let error):
                    print(error.localizedDescription)
                    
                case .success(let searchResponse):
                    
                    if let searchedMovies = searchResponse.Search {
                        
                        self.movies = searchedMovies
                        
                        DispatchQueue.main.async {
                            self.movieCollectionView.reloadData()
                        }
                    }
                    
                    
                    
    
                }
            }
        }
    
    
    
}


extension MovieRatingViewController {
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return movies.count
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: movieCellIdenifier, for: indexPath) as! MovieCell
         cell.backgroundColor = .blue
         
         let selectedMovie = movies[indexPath.item]
         cell.movieDetails = selectedMovie
       
        return cell
    }
    
  
    
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         
         let selectedMovie = movies[indexPath.item]
     
    }
    
}

extension MovieRatingViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = (collectionView.bounds.width - 20)/2
        return CGSize(width: collectionViewWidth, height: 180)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    
    
}
