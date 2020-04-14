//
//  ExpyAbstractions.swift
//  ExpyTableView
//
//  Created by Okhan on 08/03/2018.
//

import UIKit

public struct ExpyTableViewDefaultValues {
	public static let expandableStatus = true
      public static let expandingAnimation: UITableView.RowAnimation = .fade
      public static let collapsingAnimation: UITableView.RowAnimation = .fade
}

@objc public enum ExpyState: Int {
	case willExpand, willCollapse, didExpand, didCollapse
}

public enum ExpyActionType {
	case expand, collapse
}

@objc public protocol ExpyTableViewHeaderCell: class {
	func changeState(_ state: ExpyState, cellReuseStatus cellReuse: Bool)
}

@objc public protocol ExpyTableViewDataSource: UITableViewDataSource {
	func tableView(_ tableView: ExpyTableView, canExpandSection section: Int) -> Bool
	func tableView(_ tableView: ExpyTableView, expandableCellForSection section: Int) -> UITableViewCell
}

@objc public protocol ExpyTableViewDelegate: UITableViewDelegate {
	func tableView(_ tableView: ExpyTableView, expyState state: ExpyState, changeForSection section: Int)
}
