//
//  CustomizationExampleViewController.swift
//  ExpyTableView
//
//  Created by Okhan on 16/06/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import ExpyTableView

class CustomizationExampleViewController: UIViewController {

	let sampleData = [["iPhone SE", "64 GB Memory", "4 inches", "Apple A9, 64 bit"],
	                  ["iPhone 6", "128 GB Memory", "4.7 inches", "Apple A8, 64 bit"],
	                  ["iPhone 7 Plus", "256 GB Memory", "5.5 inches", "Apple A10 Fusion(64 bit)", "Force Touch: Yes"],
	                  ["iPhone SE", "64 GB Memory", "4 inches", "Apple A9, 64 bit"],
	                  ["iPhone 6", "128 GB Memory", "4.7 inches", "Apple A8, 64 bit"],
	                  ["iPhone 7 Plus", "256 GB Memory", "5.5 inches", "Apple A10 Fusion(64 bit)", "Force Touch: Yes"],
	                  ["iPhone SE", "64 GB Memory", "4 inches", "Apple A9, 64 bit"],
	                  ["iPhone 6", "128 GB Memory", "4.7 inches", "Apple A8, 64 bit"],
	                  ["iPhone 7 Plus", "256 GB Memory", "5.5 inches", "Apple A10 Fusion(64 bit)", "Force Touch: Yes"],
	                  ["iPhone SE", "64 GB Memory", "4 inches", "Apple A9, 64 bit"],
	                  ["iPhone 6", "128 GB Memory", "4.7 inches", "Apple A8, 64 bit"],
	                  ["iPhone 7 Plus", "256 GB Memory", "5.5 inches", "Apple A10 Fusion(64 bit)", "Force Touch: Yes"]]
	
	@IBOutlet weak var expandableTableView: ExpyTableView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
				expandableTableView.dataSource = self
				expandableTableView.delegate = self
			
				//Alter the animations as you want
				expandableTableView.expandingAnimation = .fade
				expandableTableView.collapsingAnimation = .fade
			
				expandableTableView.tableFooterView = UIView()
			
				navigationItem.title = "iPhones"
    }
}

//MARK: ExpyTableViewDataSourceMethods
extension CustomizationExampleViewController: ExpyTableViewDataSource {
	func canExpand(section: Int, inTableView tableView: ExpyTableView) -> Bool {
		return true
	}
		
	func expandableCell(forSection section: Int, inTableView tableView: ExpyTableView) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PhoneNameTableViewCell.self)) as! PhoneNameTableViewCell
		cell.labelPhoneName.text = sampleData[section].first!
		cell.setImage(with: (tableView.getActionType(forSection: section)))
		cell.layoutMargins = UIEdgeInsets.zero
		
		let type = tableView.getActionType(forSection: section)
		cell.setImage(with: type)
		cell.changeSeperatorAppearence(with: type)
		
		return cell
	}
}

//MARK: ExpyTableView delegate methods
extension CustomizationExampleViewController: ExpyTableViewDelegate {
	func expyTableViewWillChangeState(withType type: ExpyActionType, forSection section: Int, inTableView tableView: ExpyTableView, animated: Bool) {
		
		switch type {
		case .expand:
			print("WILL EXPAND")
			
		case .collapse:
			print("WILL COLLAPSE")
			
		}
	}
	
	func expyTableViewDidChangeState(withType type: ExpyActionType, forSection section: Int, inTableView tableView: ExpyTableView, animated: Bool) {
		
		switch type {
		case .expand:
			print("DID EXPAND")
			
		case .collapse:
			print("DID COLLAPSE")
		}
	}
}

extension CustomizationExampleViewController {
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return (section % 3 == 0) ? "iPhone Models" : nil
	}
}

extension CustomizationExampleViewController {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print("DID SELECT row: \(indexPath.row), section: \(indexPath.section)")
	}
}
//MARK: UITableView Data Source Methods 
extension CustomizationExampleViewController {
	func numberOfSections(in tableView: UITableView) -> Int {
		return sampleData.count
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		print("Row count for section \(section) is \(sampleData[section].count)")
		return sampleData[section].count + 1 // +1 here is for BuyTableViewCell
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
			let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: BuyTableViewCell.self)) as! BuyTableViewCell
			cell.layoutMargins = UIEdgeInsets.zero
			cell.showSeparator()
			return cell
			
		}else {
			let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SpecificationTableViewCell.self)) as! SpecificationTableViewCell
			cell.labelSpecification.text = (sampleData[indexPath.section])[indexPath.row]
			cell.layoutMargins = UIEdgeInsets.zero
			cell.hideSeparator()
			return cell
		}
	}
}

//MARK: Used Table View Classes

class PhoneNameTableViewCell: UITableViewCell {
	
	@IBOutlet weak var labelPhoneName: UILabel!
	@IBOutlet weak var imageViewArrow: UIImageView!
	
	func setImage(with actionType: ExpyActionType) {
		imageViewArrow.image = (actionType == .expand) ? #imageLiteral(resourceName: "ArrowDown") : #imageLiteral(resourceName: "ArrowRight")
	}
}

class SpecificationTableViewCell: UITableViewCell {
	@IBOutlet weak var labelSpecification: UILabel!
}

class BuyTableViewCell: UITableViewCell {}

extension UITableViewCell {
	func changeSeperatorAppearence(with type: ExpyActionType) {
		switch type {
			
		case .expand:
			hideSeparator()
			
		case .collapse:
			showSeparator()
		}
	}
	
	func showSeparator() {
		self.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
	}
	
	func hideSeparator() {
		self.separatorInset = UIEdgeInsets(top: 0, left: self.contentView.bounds.size.width, bottom: 0, right: 0)
	}
}
