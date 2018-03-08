//
//  ExpyAbstractions.swift
//  ExpyTableView
//
//  Created by Okhan on 08/03/2018.
//

import Foundation

public struct ExpyTableViewDefaultValues {
	public static let expandableStatus = true
	public static let expandingAnimation: UITableViewRowAnimation = .fade
	public static let collapsingAnimation: UITableViewRowAnimation = .fade
}

public enum ExpyState: Int {
	case willExpand, willCollapse, didExpand, didCollapse
}

public enum ExpyActionType {
	case expand, collapse
}

public protocol ExpyTableViewHeaderCell: class {
	func changeState(_ state: ExpyState, cellReuseStatus cellReuse: Bool)
}

public protocol ExpyTableViewDataSource: UITableViewDataSource {
	func tableView(_ tableView: ExpyTableView, canExpandSection section: Int) -> Bool
	func tableView(_ tableView: ExpyTableView, expandableCellForSection section: Int) -> UITableViewCell
}

public extension ExpyTableViewDataSource {
	func tableView(_ tableView: ExpyTableView, canExpandSection section: Int) -> Bool {
		return ExpyTableViewDefaultValues.expandableStatus
	}
}

public protocol ExpyTableViewDelegate: UITableViewDelegate {
	func tableView(_ tableView: ExpyTableView, expyState state: ExpyState, changeForSection section: Int)
}

public extension ExpyTableViewDelegate {
	func tableView(_ tableView: ExpyTableView, expyState state: ExpyState, changeForSection section: Int) {}
}
