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
		expandableTableView.delegate = self
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationItem.title = "Basic Example"
	}
}

//All you have to do is to implement this method. If you have a current table view which is not expandable, you can turn it into an expandable table view just by copying and pasting the code for first cell from cellForRowAtIndexPath method.

extension BasicExampleViewController: ExpyTableViewDataSource, ExpyTableViewDelegate {
	func expandableCell(forSection section: Int, inTableView tableView: ExpyTableView) -> UITableViewCell {
		return tableView.dequeueReusableCell(withIdentifier: String(describing: HeaderTableViewCell.self)) as! HeaderTableViewCell
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
		// then you will not get callback for IndexPath(row: 0, section: indexPath.section)
		//But if you define the same cell as -sometimes not expandable- you will get callbacks for not expandable cells here and you must return a cell for IndexPath(row: 0, section: indexPath.section) in here besides in expandingCell. You can return the same cell from expandingCell method and here.
			
		case 1:
			return tableView.dequeueReusableCell(withIdentifier: String(describing: FirstTableViewCell.self)) as! FirstTableViewCell
			
		case 2:
			return tableView.dequeueReusableCell(withIdentifier: String(describing: SecondTableViewCell.self)) as! SecondTableViewCell
			
		default:
			return tableView.dequeueReusableCell(withIdentifier: String(describing: ThirdTableViewCell.self)) as! ThirdTableViewCell
		}
	}
}

class FirstTableViewCell: UITableViewCell {}
class SecondTableViewCell: UITableViewCell {}
class ThirdTableViewCell: UITableViewCell {}
class HeaderTableViewCell: UITableViewCell {}
