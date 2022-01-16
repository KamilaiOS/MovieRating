//
//  MovieCell.swift
//  MovieRating
//
//  Created by Kamila Lech on 15/01/2022.
//

import Foundation
import UIKit

class MovieCell : UICollectionViewCell {
    
    //imageView
   var titleLabel = UILabel()
    
    
    var movieDetails : MovieResponce? {
        didSet {
            
            print("🔵 \(movieDetails?.Title ?? "") :: \(movieDetails?.Year ?? "") :: \(movieDetails?.MovieType ?? "")")
          
        }
    }
  
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        titleLabel.backgroundColor = .yellow
        
        layout()
       
        
        
    }
    
    func layout(){
        
        let blurView = UIView(frame: CGRect(x: 0, y: self.frame.height - 60, width: self.frame.width, height: 100))
        
        blurView.backgroundColor = .green
        
        addSubview(blurView)
        
//        titleLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
//        titleLabel.widthAnchor.constraint(equalToConstant: 400).isActive = true
//        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
}


