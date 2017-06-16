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

	let sampleData = [["MacBook", "8GB 1866MHz LPDDR3 memory", "1.2GHz Processor", "256GB SSD storage", "12-inches"],
	                  ["MacBook Air", "4GB 2133MHz LPDDR3 memory", "2.3GHz Intel Core i5 processor", "256 GB SSD Storage", "13-inches"],
	                  ["MacBook Pro", "8GB 2133MHz LPDDR3 memory", "3.1GHz dual-core Intel Core i5 processor", "512 GB SSD Storage", "15-inches"],
	                  ["MacBook", "8GB 1866MHz LPDDR3 memory", "1.2GHz Processor", "256GB SSD storage", "12-inches"],
	                  ["MacBook Air", "4GB 2133MHz LPDDR3 memory", "2.3GHz Intel Core i5 processor", "256 GB SSD Storage", "13-inches"],
	                  ["MacBook Pro", "8GB 2133MHz LPDDR3 memory", "3.1GHz dual-core Intel Core i5 processor", "512 GB SSD Storage", "15-inches"],
	                  ["MacBook", "8GB 1866MHz LPDDR3 memory", "1.2GHz Processor", "256GB SSD storage", "12-inches"],
	                  ["MacBook Air", "4GB 2133MHz LPDDR3 memory", "2.3GHz Intel Core i5 processor", "256 GB SSD Storage", "13-inches"],
	                  ["MacBook Pro", "8GB 2133MHz LPDDR3 memory", "3.1GHz dual-core Intel Core i5 processor", "512 GB SSD Storage", "15-inches"],
	                  ["MacBook", "8GB 1866MHz LPDDR3 memory", "1.2GHz Processor", "256GB SSD storage", "12-inches"],
	                  ["MacBook Air", "4GB 2133MHz LPDDR3 memory", "2.3GHz Intel Core i5 processor", "256 GB SSD Storage", "13-inches"],
	                  ["MacBook Pro", "8GB 2133MHz LPDDR3 memory", "3.1GHz dual-core Intel Core i5 processor", "512 GB SSD Storage", "15-inches"],
	                  ["MacBook", "8GB 1866MHz LPDDR3 memory", "1.2GHz Processor", "256GB SSD storage", "12-inches"],
	                  ["MacBook Air", "4GB 2133MHz LPDDR3 memory", "2.3GHz Intel Core i5 processor", "256 GB SSD Storage", "13-inches"],
	                  ["MacBook Pro", "8GB 2133MHz LPDDR3 memory", "3.1GHz dual-core Intel Core i5 processor", "512 GB SSD Storage", "15-inches"]]
	
	let sectionHeaderHeight: CGFloat = 0.5
	let sectionFooterHeight: CGFloat = 0.5
	
	@IBOutlet weak var expandableTableView: ExpyTableView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
				expandableTableView.dataSource = self
				expandableTableView.delegate = self
			
				expandableTableView.estimatedRowHeight = 44
				expandableTableView.rowHeight = UITableViewAutomaticDimension
			
				//Alter the animations as you want
				expandableTableView.expandingAnimation = .fade
				expandableTableView.collapsingAnimation = .fade
			
				expandableTableView.sectionHeaderHeight = sectionHeaderHeight
				expandableTableView.sectionFooterHeight = sectionFooterHeight
			
				navigationItem.title = "MacBooks"
    }
}

//MARK: ExpyTableViewDataSourceMethods
extension CustomizationExampleViewController: ExpyTableViewDataSource {
	func canExpand(section: Int, inTableView tableView: ExpyTableView) -> Bool {
		return true
	}
		
	func expandableCell(forSection section: Int, inTableView tableView: ExpyTableView) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MacNameTableViewCell.self)) as! MacNameTableViewCell
		cell.labelMacName.text = sampleData[section].first!
		cell.setImage(with: (tableView.getActionType(forSection: section)))
		return cell
	}
}

//MARK: ExpyTableView delegate methods
extension CustomizationExampleViewController: ExpyTableViewDelegate {
	func expyTableViewWillChangeState(withType type: ExpyActionType, forSection section: Int, inTableView tableView: ExpyTableView, animated: Bool) {
		
		(tableView.cellForRow(at: IndexPath(row: 0, section: section)) as? MacNameTableViewCell)?.setImage(with: type)
		
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

//MARK: UITableView Data Source Methods 
extension CustomizationExampleViewController {
	func numberOfSections(in tableView: UITableView) -> Int {
		return sampleData.count
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return sampleData[section].count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
			return tableView.dequeueReusableCell(withIdentifier: String(describing: BuyTableViewCell.self)) as! BuyTableViewCell
			
		}else {
			let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SpecificationTableViewCell.self)) as! SpecificationTableViewCell
			cell.labelSpecification.text = (sampleData[indexPath.section])[indexPath.row]
			return cell
		}
	}
}

//MARK: Use header and footer as separator of the section.
extension CustomizationExampleViewController {
	
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let view = UIView()
		view.backgroundColor = UIColor.lightGray
		return view
	}
	
	func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		let view = UIView()
		view.backgroundColor = UIColor.lightGray
		return view
	}
}

//MARK: Used Table View Classes

class MacNameTableViewCell: UITableViewCell {
	@IBOutlet weak var labelMacName: UILabel!
	@IBOutlet weak var imageViewArrow: UIImageView!
	
	func setImage(with actionType: ExpyActionType) {
		imageViewArrow.image = (actionType == .expand) ? #imageLiteral(resourceName: "ArrowDown") : #imageLiteral(resourceName: "ArrowRight")
	}
}

class SpecificationTableViewCell: UITableViewCell {
	@IBOutlet weak var labelSpecification: UILabel!
}

class BuyTableViewCell: UITableViewCell {}

