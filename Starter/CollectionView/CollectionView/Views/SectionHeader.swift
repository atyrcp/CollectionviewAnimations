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
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
}
