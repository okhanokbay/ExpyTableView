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

	let sampleData = [["iPhone SE (3 Items)", "64 GB Memory", "4 inches", "Apple A9, 64 bit"],
	                  ["iPhone 6 (3 Items)", "128 GB Memory", "4.7 inches", "Apple A8, 64 bit"],
	                  ["iPhone 7 Plus (4 Items)", "256 GB Memory", "5.5 inches", "Apple A10 Fusion(64 bit)", "Force Touch: Yes"],
	                  ["iPhone SE (3 Items)", "64 GB Memory", "4 inches", "Apple A9, 64 bit"],
	                  ["iPhone 6 (3 Items)", "128 GB Memory", "4.7 inches", "Apple A8, 64 bit"],
	                  ["iPhone 7 Plus (4 Items)", "256 GB Memory", "5.5 inches", "Apple A10 Fusion(64 bit)", "Force Touch: Yes"],
	                  ["iPhone SE (3 Items)", "64 GB Memory", "4 inches", "Apple A9, 64 bit"],
	                  ["iPhone 6 (3 Items)", "128 GB Memory", "4.7 inches", "Apple A8, 64 bit"],
	                  ["iPhone 7 Plus (4 Items)", "256 GB Memory", "5.5 inches", "Apple A10 Fusion(64 bit)", "Force Touch: Yes"],
	                  ["iPhone SE (3 Items)", "64 GB Memory", "4 inches", "Apple A9, 64 bit"],
	                  ["iPhone 6 (3 Items)", "128 GB Memory", "4.7 inches", "Apple A8, 64 bit"],
	                  ["iPhone 7 Plus (4 Items)", "256 GB Memory", "5.5 inches", "Apple A10 Fusion(64 bit)", "Force Touch: Yes"]]
	
	@IBOutlet weak var expandableTableView: ExpyTableView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
				expandableTableView.dataSource = self
				expandableTableView.delegate = self
			
				expandableTableView.rowHeight = UITableViewAutomaticDimension
				expandableTableView.estimatedRowHeight = 44
			
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
		cell.layoutMargins = UIEdgeInsets.zero
		cell.showSeparator()
		return cell
	}
}

//MARK: ExpyTableView delegate methods
extension CustomizationExampleViewController: ExpyTableViewDelegate {
	func tableView(_ tableView: ExpyTableView, expyState state: ExpyState, changeForSection section: Int) {
	
		switch state {
		case .willExpand:
			print("WILL EXPAND")
			
		case .willCollapse:
			print("WILL COLLAPSE")
			
		case .didExpand:
			print("DID EXPAND")
			
		case .didCollapse:
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
		//If you don't deselect the row here, seperator of the above cell of the selected cell disappears.
		//Check here for detail: https://stackoverflow.com/a/27409583/4168746
		//This solution obviously has side effects, you can implement your own solution. This is not a bug of ExpyTableView hence you should solve it.
		tableView.deselectRow(at: indexPath, animated: false)
		
		print("DID SELECT row: \(indexPath.row), section: \(indexPath.section)")
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return UITableViewAutomaticDimension
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

class PhoneNameTableViewCell: UITableViewCell, ExpyTableViewCell{
	
	@IBOutlet weak var labelPhoneName: UILabel!
	@IBOutlet weak var imageViewArrow: UIImageView!
	
	func change(_ state: ExpyState) {
		
		switch state {
		case .willExpand:
			print("WILL EXPAND")
			hideSeparator()
			arrowDown()
			
		case .willCollapse:
			print("WILL COLLAPSE")
			showSeparator()
			arrowRight()
			
		case .didExpand:
			print("DID EXPAND")
			
		case .didCollapse:
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
		self.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
	}
	
	func hideSeparator() {
		self.separatorInset = UIEdgeInsets(top: 0, left: UIScreen.main.bounds.size.width, bottom: 0, right: 0)
	}
}
