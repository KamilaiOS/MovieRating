//
//  MovieCell.swift
//  MovieRating
//
//  Created by Akib Quraishi on 15/01/2022.
//

import Foundation
import UIKit

class MovieCell : UICollectionViewCell {
    
   
    
    
    var movieDetails : MovieResponce? {
        didSet {
            
            print("🔵 \(movieDetails?.Title ?? "") :: \(movieDetails?.Year ?? "") :: \(movieDetails?.MovieType ?? "")")
        }
    }
  
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
