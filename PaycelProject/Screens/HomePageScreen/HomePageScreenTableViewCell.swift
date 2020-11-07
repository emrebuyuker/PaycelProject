//
//  HomePageScreenTableViewCell.swift
//  PaycelProject
//
//  Created by Emre BÜYÜKER on 7.11.2020.
//

import UIKit
import SDWebImage

class HomePageScreenTableViewCell: UITableViewCell {
	
	// MARK: - Constans
	
	private let notApplicableText = "N/A"
	private let loadingIconName = "loadingIcon"
	private let viewBorderWidth: CGFloat = 1
	private let viewCornerRadius: CGFloat = 15
	private let minimumYear = 2010
	private let viewLightAlpha: CGFloat = 0.5
	private let viewAlpha: CGFloat = 1
	private let zero = 0
	
	// MARK: - Properties
	
	var yearInt: Int?
	
	// MARK: - Outlets
	
	@IBOutlet weak var posterImageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var imdbLabel: UILabel!
	@IBOutlet weak var yearLabel: UILabel!
	@IBOutlet weak var typeLabel: UILabel!
	@IBOutlet weak var cellView: UIView!
	
    override func awakeFromNib() {
        super.awakeFromNib()
		self.cellView.layer.borderWidth = self.viewBorderWidth
		self.cellView.layer.borderColor = UIColor.black.cgColor
		self.cellView.layer.cornerRadius = self.viewCornerRadius
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	func homePageScreenTableViewCellMethod(imageViewUrl: String, titleText: String, imdbText: String, yearText: String, typeText: String) {
		
		if Int(yearText) != nil {
			self.yearInt = Int(yearText)
			if self.yearInt! <= minimumYear {
				self.cellView.alpha = viewLightAlpha
			} else {
				self.cellView.alpha = viewAlpha
			}
		} else {
			self.yearInt = zero
		}
		
		if imageViewUrl != notApplicableText {
			self.posterImageView.sd_setImage(with: URL(string: imageViewUrl))
		} else {
			self.posterImageView.image = UIImage(named: loadingIconName)
		}
		self.titleLabel.text = titleText
		self.imdbLabel.text = imdbText
		self.yearLabel.text = "\(self.yearInt ?? zero)"
		self.typeLabel.text = typeText
	}
}
