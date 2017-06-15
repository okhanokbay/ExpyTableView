//
//  ViewController.swift
//  ExpyTableView
//
//  Created by okhanokbay on 06/15/2017.
//  Copyright (c) 2017 okhanokbay. All rights reserved.
//

import UIKit
import ExpyTableView

class ViewController: UIViewController {
	
	fileprivate enum CellType: Int {
		case header, first, second, third
	}
	
	@IBOutlet weak var expandableTableView: ExpyTableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		expandableTableView.dataSource = self
		expandableTableView.delegate = self
	}
	
	func getHeaderCell(from tableView: UITableView) -> UITableViewCell {
		return tableView.dequeueReusableCell(withIdentifier: String(describing: HeaderTableViewCell.self)) as! HeaderTableViewCell
	}
}

extension ViewController: ExpyTableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return 14
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 4
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		switch CellType(rawValue: indexPath.row)! {
			
		case .header:
			return getHeaderCell(from: tableView)
			
		case .first:
			return tableView.dequeueReusableCell(withIdentifier: String(describing: FirstTableViewCell.self)) as! FirstTableViewCell
			
		case .second:
			return tableView.dequeueReusableCell(withIdentifier: String(describing: SecondTableViewCell.self)) as! SecondTableViewCell
			
		case .third:
			return tableView.dequeueReusableCell(withIdentifier: String(describing: ThirdTableViewCell.self)) as! ThirdTableViewCell
		}
	}
	
	func expandingCell(forSection section: Int, inTableView tableView: ExpyTableView) -> UITableViewCell {
		return getHeaderCell(from: tableView)
	}
}

extension ViewController: ExpyTableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print("row is selected: section: \(indexPath.section) row: \(indexPath.row)")
	}
	
	func expyTableViewWillChangeState(withType type: ExpyActionType, forSection section: Int, inTableView tableView: ExpyTableView, animated: Bool) {
		switch type {
		case .expand:
			print("WILL COLLAPSE")
			
		case .collapse:
			print("WILL EXPAND")
		}
	}
	
	func expyTableViewDidChangeState(withType type: ExpyActionType, forSection section: Int, inTableView tableView: ExpyTableView, animated: Bool) {
		switch type {
		case .expand:
			print("DID COLLAPSE")
			
		case .collapse:
			print("DID EXPAND")
			}
	}
}

class FirstTableViewCell: UITableViewCell {}
class SecondTableViewCell: UITableViewCell {}
class ThirdTableViewCell: UITableViewCell {}
class HeaderTableViewCell: UITableViewCell {}
