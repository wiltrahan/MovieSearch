//
//  MovieCell.swift
//  MovieSearch
//
//  Created by William Trahan on 4/5/20.
//  Copyright © 2020 Wil Trahan. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell{
    
    @IBOutlet weak var moviePosterView: UIImageView!
    @IBOutlet weak var movieTitleView: UILabel!
    @IBOutlet weak var movieDateView: UILabel!
    @IBOutlet weak var movieOverview: UITextView!
}
