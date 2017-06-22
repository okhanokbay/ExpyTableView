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
	
	var currentState: ExpyActionType?
	
	@IBOutlet weak var labelPhoneName: UILabel!
	@IBOutlet weak var imageViewArrow: UIImageView!
	
	override func prepareForReuse() {
		super.prepareForReuse()
		
		//Avoiding the side effects of cell reusing
		switch currentState ?? .collapse { //If your cells are expanded as default, then write (switch currentState ?? .expand) here
		case .expand:
			hideSeparator()
			arrowDown()
			
		case .collapse:
			hideSeparator()
			arrowRight()
		}
	}
	
	func change(_ state: ExpyState) {
		
		switch state {
		case .willExpand:
			print("WILL EXPAND")
			hideSeparator()
			arrowDown()
			
		case .willCollapse:
			print("WILL COLLAPSE")
			arrowRight()
			
		case .didExpand:
			print("DID EXPAND")
			
		case .didCollapse:
			showSeparator()
			print("DID COLLAPSE")
		}
	}
	
	private func arrowDown() {
		UIView.animate(withDuration: 0.3) { [weak self] _ in
			self?.imageViewArrow.transform = CGAffineTransform(rotationAngle: (CGFloat.pi / 2))
		}
	}
	
	private func arrowRight() {
		UIView.animate(withDuration: 0.3) { [weak self] _ in
			self?.imageViewArrow.transform = CGAffineTransform(rotationAngle: 0)
		}
	}
}

class SpecificationTableViewCell: UITableViewCell {
	@IBOutlet weak var labelSpecification: UILabel!
}

class BuyTableViewCell: UITableViewCell {}

extension UITableViewCell {
	func showSeparator() {
		DispatchQueue.main.async { [weak self] _ in
			self?.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
		}
	}
	
	func hideSeparator() {
		DispatchQueue.main.async { [weak self] in
			self?.separatorInset = UIEdgeInsets(top: 0, left: UIScreen.main.bounds.size.width, bottom: 0, right: 0)
		}
	}
}
