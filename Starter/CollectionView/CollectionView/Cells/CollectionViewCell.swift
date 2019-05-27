import UIKit

class CollectionViewCell: UICollectionViewCell {
	@IBOutlet private weak var titleLabel:UILabel!
	@IBOutlet private weak var selectionImage:UIImageView!
    @IBOutlet private weak var mainImageView: UIImageView!
    
    var park: Park? {
        didSet {
            if let park = park {
                mainImageView.image = UIImage(named: park.photo)
            }
        }
    }
    
	var isEditing: Bool = false {
		didSet {
			selectionImage.isHidden = !isEditing
		}
	}
    
    override func prepareForReuse() {
        mainImageView.image = nil
    }
	
	override var isSelected: Bool {
		didSet {
			if isEditing {
				selectionImage.image = isSelected ? UIImage(named: "Checked") : UIImage(named: "Unchecked")
			}
		}
	}
}
