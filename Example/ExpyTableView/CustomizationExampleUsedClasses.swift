//
//  CustomizationExampleUsedClasses.swift
//  ExpyTableView
//
//  Created by Okhan on 22/06/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import ExpyTableView

//MARK: Used Table View Classes

class PhoneNameTableViewCell: UITableViewCell, ExpyTableViewHeaderCell{
	
	@IBOutlet weak var labelPhoneName: UILabel!
	@IBOutlet weak var imageViewArrow: UIImageView!
	
	func changeState(_ state: ExpyState, cellReuseStatus cellReuse: Bool) {
		
		switch state {
		case .willExpand:
			print("WILL EXPAND")
			hideSeparator()
			arrowDown(animated: !cellReuse)
			
		case .willCollapse:
			print("WILL COLLAPSE")
			arrowRight(animated: !cellReuse)
			
		case .didExpand:
			print("DID EXPAND")
			
		case .didCollapse:
			showSeparator()
			print("DID COLLAPSE")
		}
	}
	
	private func arrowDown(animated: Bool) {
		UIView.animate(withDuration: (animated ? 0.3 : 0)) {
			self.imageViewArrow.transform = CGAffineTransform(rotationAngle: (CGFloat.pi / 2))
		}
	}
	
	private func arrowRight(animated: Bool) {
		UIView.animate(withDuration: (animated ? 0.3 : 0)) {
			self.imageViewArrow.transform = CGAffineTransform(rotationAngle: 0)
		}
	}
}

class SpecificationTableViewCell: UITableViewCell {
	@IBOutlet weak var labelSpecification: UILabel!
}

class BuyTableViewCell: UITableViewCell {}

extension UITableViewCell {

	func showSeparator() {
		DispatchQueue.main.async {
			self.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
		}
	}
	
	func hideSeparator() {
		DispatchQueue.main.async {
			self.separatorInset = UIEdgeInsets(top: 0, left: self.bounds.size.width, bottom: 0, right: 0)
		}
	}
}
