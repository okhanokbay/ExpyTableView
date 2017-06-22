//
//  BasicExampleViewController.swift
//  ExpyTableView
//
//  Created by Okhan on 16/06/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import ExpyTableView

class BasicExampleViewController: UIViewController {
	
	@IBOutlet weak var expandableTableView: ExpyTableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		expandableTableView.dataSource = self
		expandableTableView.delegate = self //Optional. In this example we use didSelectRowAtIndexPath to solve a known problem. Sepearator disapperance.
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationItem.title = "Basic Example"
	}
}

//All you have to do is to implement this method. If you have a current table view which is not expandable, you can turn it into an expandable table view just by copying and pasting the code for first cell from cellForRowAtIndexPath method.

extension BasicExampleViewController: ExpyTableViewDataSource {
	func expandableCell(forSection section: Int, inTableView tableView: ExpyTableView) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HeaderTableViewCell.self)) as! HeaderTableViewCell
		//Make your customizations here.
		cell.labelHeader.text = "Section: \(section) Row: 0"
		return cell
	}
}

//MARK: Basic Table View Implementation, no need to write UITableViewDataSource because ExpyTableViewDataSource is forwarding all the delegate methods of UITableView that are not handled by itself.

extension BasicExampleViewController {
	func numberOfSections(in tableView: UITableView) -> Int {
		return 14
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 4
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		switch indexPath.row {
			
		// If you define a cell as expandable and return it from expandingCell data source method,
		// then you will not get callback for IndexPath(row: 0, section: indexPath.section) here in cellForRowAtIndexPath
		//But if you define the same cell as -sometimes not expandable- you will get callbacks for not expandable cells here and you must return a cell for IndexPath(row: 0, section: indexPath.section) in here besides in expandingCell. You can return the same cell from expandingCell method and here.
			
		case 1:
			let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FirstTableViewCell.self)) as! FirstTableViewCell
			cell.labelFirst.text = "Section: \(indexPath.section) Row: \(indexPath.row)"
			return cell
			
		case 2:
			let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SecondTableViewCell.self)) as! SecondTableViewCell
			cell.labelSecond.text = "Section: \(indexPath.section) Row: \(indexPath.row)"
			return cell
			
		default:
			let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ThirdTableViewCell.self)) as! ThirdTableViewCell
			cell.labelThird.text = "Section: \(indexPath.section) Row: \(indexPath.row)"
			return cell
		}
	}
}

extension BasicExampleViewController: ExpyTableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		//If you don't deselect the row here, seperator of the above cell of the selected cell disappears.
		//Check here for detail: https://stackoverflow.com/a/27409583/4168746
		//This solution obviously has side effects, you can implement your own solution. This is not a bug of ExpyTableView hence you should solve it.
		tableView.deselectRow(at: indexPath, animated: false)
		
		print("DID SELECT row: \(indexPath.row), section: \(indexPath.section)")
	}
}

class FirstTableViewCell: UITableViewCell {
	@IBOutlet weak var labelFirst: UILabel!
}
class SecondTableViewCell: UITableViewCell {
	@IBOutlet weak var labelSecond: UILabel!
}
class ThirdTableViewCell: UITableViewCell {
	@IBOutlet weak var labelThird: UILabel!
}
class HeaderTableViewCell: UITableViewCell {
	@IBOutlet weak var labelHeader: UILabel!
}
