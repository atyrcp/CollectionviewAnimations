//
//  FlowLayout.swift
//  CollectionView
//
//  Created by alien on 2019/5/27.
//  Copyright © 2019 Razeware. All rights reserved.
//

import UIKit

class FlowLayout: UICollectionViewFlowLayout {
    
    var addedItem: IndexPath?
    var deletedItems: [IndexPath]?
    
    override func initialLayoutAttributesForAppearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard let attribute = super.initialLayoutAttributesForAppearingItem(at: itemIndexPath), let added = addedItem, added == itemIndexPath else {
            return nil
        }
        attribute.center = CGPoint(x: collectionView!.frame.width - 23.5, y: -24.5)
        attribute.alpha = 1
        attribute.transform = CGAffineTransform(scaleX: 0.15, y: 0.15)
        attribute.zIndex = 5
        
        return attribute
    }
    
    override func finalLayoutAttributesForDisappearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard let attribute = super.finalLayoutAttributesForDisappearingItem(at: itemIndexPath), let deleted = deletedItems, deleted.contains(itemIndexPath) else {
            return nil
        }
        attribute.alpha = 1
        attribute.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        attribute.zIndex = -1
        
        return attribute
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var result = [UICollectionViewLayoutAttributes]()
        
        if let attributes = super.layoutAttributesForElements(in: rect) {
            for item in attributes {
                let cellAttribute = item.copy() as! UICollectionViewLayoutAttributes
                if item.representedElementKind == nil {
                    let frame = cellAttribute.frame
                    cellAttribute.frame = frame.insetBy(dx: 2, dy: 2)
                }
                result.append(cellAttribute)
            }
        }
        
        
        return result
    }
}
