//
//  SectionHeader.swift
//  CollectionView
//
//  Created by alien on 2019/5/27.
//  Copyright © 2019 Razeware. All rights reserved.
//

import UIKit

class SectionHeader: UICollectionReusableView {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var countLabel: UILabel!
    
    var section: Section! {
        didSet {
            titleLabel.text = section.title
            flagImageView.image = UIImage(named: section.title ?? "")
            countLabel.text = "\(section.count)"
        }
    }
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
}
