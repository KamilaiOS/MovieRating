//
//  ViewController.swift
//  MovieRating
//
//  Created by Kamila Lech on 15/01/2022.
//

import UIKit

class MovieSearchController: UIViewController, UISearchBarDelegate {
  
private let movieCellIdenifier = "MovieCell"
    
   lazy var searchBar : UISearchBar = {
       let sb = UISearchBar()
       sb.placeholder = "searchBarPlaceHolder"
       //sb.barTintColor = .gray
       sb.keyboardAppearance = .dark
       //UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = UIColor(red: 230, green: 230, blue: 230, alpha: 1.0)
       sb.delegate = self
       sb.autocapitalizationType = .none
       //sb.barStyle = .black
       return sb
    }()
   
    var movies = [MovieResponce]()
    
    let movieCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        movieCollectionView.register(MovieCell.self, forCellWithReuseIdentifier: movieCellIdenifier)
       
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
        movieCollectionView.backgroundColor = .purple
     
       
        
        setUpSearchBar()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
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
    
    func setUpSearchBar () {
        
        let frame = CGRect(x: 0, y: 40, width: view.frame.width, height: 44)
        let seachBarContainerView = UIView(frame: frame)
        seachBarContainerView.backgroundColor = .clear
        
        searchBar.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 44)
        seachBarContainerView.addSubview(searchBar)
        view.addSubview(seachBarContainerView)
        
        movieCollectionView.frame = CGRect(x: 0, y: 84, width: view.frame.width, height: view.frame.height - 84)
        view.addSubview(movieCollectionView)
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
        getMovies(searchTxt: "Hell")
        }
    }
    
}


extension MovieSearchController : UICollectionViewDelegate, UICollectionViewDataSource {
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return 8 //movies.count
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: movieCellIdenifier, for: indexPath) as! MovieCell
         cell.backgroundColor = .blue
         
         //let selectedMovie = movies[indexPath.item]
         //cell.movieDetails = selectedMovie
         
        return cell
    }
    
  
    
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         
         let selectedMovie = movies[indexPath.item]
     
    }
    
}

extension MovieSearchController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = (collectionView.bounds.width - 20)/2
        return CGSize(width: collectionViewWidth, height: 300)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    
    
}
