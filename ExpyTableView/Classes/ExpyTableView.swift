//
//  ExpyTableView.swift
//
//  Created by Okhan Okbay on 15/06/2017.
//
//  The MIT License (MIT)
//
//  Copyright (c) 2017 okhanokbay
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import UIKit

@objc public enum ExpyState: Int {
	case willExpand, willCollapse, didExpand, didCollapse
}

public enum ExpyActionType {
	case expand, collapse
}

public protocol ExpyTableViewCell {
	func change(_ state: ExpyState)
}

@objc public protocol ExpyTableViewDataSource: UITableViewDataSource {
	@objc optional func canExpand(section: Int, inTableView tableView: ExpyTableView) -> Bool //default is true, which means all header cells are expandable
	func expandableCell(forSection section: Int, inTableView tableView: ExpyTableView) -> UITableViewCell
}

@objc public protocol ExpyTableViewDelegate: UITableViewDelegate {
	@objc optional func tableView(_ tableView: ExpyTableView, expyState state: ExpyState, changeForSection section: Int)
}

open class ExpyTableView: UITableView {
	
	fileprivate weak var expyDataSource: ExpyTableViewDataSource?
	fileprivate weak var expyDelegate: ExpyTableViewDelegate?
	
	public fileprivate(set) var expandableSections: [Int: Bool] = [:]
	public fileprivate(set) var visibleSections: [Int: Bool] = [:]
	
	open var expandingAnimation: UITableViewRowAnimation = .fade
	open var collapsingAnimation: UITableViewRowAnimation = .fade
	
	override public init(frame: CGRect, style: UITableViewStyle) {
		super.init(frame: frame, style: style)
	}
	
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override open var dataSource: UITableViewDataSource? {
		get {
			return super.dataSource
		}
		set(dataSource) {
			guard let dataSource = dataSource else { return }
			expyDataSource = dataSource as? ExpyTableViewDataSource
			super.dataSource = self
		}
	}
	
	override open var delegate: UITableViewDelegate? {
		get {
			return super.delegate
		}
		set(delegate) {
			guard let delegate = delegate else { return }
			expyDelegate = delegate as? ExpyTableViewDelegate
			super.delegate = self
		}
	}
	
	override open func awakeFromNib() {
		super.awakeFromNib()
		if expyDelegate == nil {
			//Set UITableViewDelegate even if ExpyTableViewDelegate is nil. Because we are getting callbacks here in didSelectRowAtIndexPath UITableViewDelegate method.
			super.delegate = self
		}
	}
}

//MARK: Protocol Helper
extension ExpyTableView {
	fileprivate func verifyProtocol(_ aProtocol: Protocol, contains aSelector: Selector) -> Bool {
		return protocol_getMethodDescription(aProtocol, aSelector, true, true).name != nil || protocol_getMethodDescription(aProtocol, aSelector, false, true).name != nil
	}
	
	override open func responds(to aSelector: Selector!) -> Bool {
		if verifyProtocol(UITableViewDataSource.self, contains: aSelector) {
			return (super.responds(to: aSelector)) || (expyDataSource?.responds(to: aSelector) ?? false)
			
		}else if verifyProtocol(UITableViewDelegate.self, contains: aSelector) {
			return (super.responds(to: aSelector)) || (expyDelegate?.responds(to: aSelector) ?? false)
		}
		return super.responds(to: aSelector)
	}
	
	override open func forwardingTarget(for aSelector: Selector!) -> Any? {
		if verifyProtocol(UITableViewDataSource.self, contains: aSelector) {
			return expyDataSource
			
		}else if verifyProtocol(UITableViewDelegate.self, contains: aSelector) {
			return expyDelegate
		}
		return super.forwardingTarget(for: aSelector)
	}
}

extension ExpyTableView {
	fileprivate func expand(_ section: Int, inTableView tableView: ExpyTableView) {
		animate(tableView, with: .expand, forSection: section)
	}
	
	fileprivate func collapse(_ section: Int, inTableView tableView: ExpyTableView) {
		animate(tableView, with: .collapse, forSection: section)
	}
	
	private func animate(_ tableView: ExpyTableView, with type: ExpyActionType, forSection section: Int) {
		guard let sectionIsExpandable = expandableSections[section], sectionIsExpandable else { return }
		
		let sectionIsVisible = visibleSections[section] ?? false
		
		//If section is visible and action type is expand, OR, If section is not visible and action type is collapse, return.
		if ((type == .expand) && (sectionIsVisible)) || ((type == .collapse) && (!sectionIsVisible)) { return }
		
		visibleSections[section] = (type == .expand)

		//Inform the delegates here.
		((self.cellForRow(at: IndexPath(row: 0, section: section))) as? ExpyTableViewCell)?.change(type == .expand ? .willExpand : .willCollapse)
		expyDelegate?.tableView?(tableView, expyState: (type == .expand ? .willExpand : .willCollapse), changeForSection: section)
		
		CATransaction.begin()
		CATransaction.setCompletionBlock { [weak self] () -> (Void) in
			//Inform the delegates here.
		((self?.cellForRow(at: IndexPath(row: 0, section: section))) as? ExpyTableViewCell)?.change(type == .expand ? .didExpand : .didCollapse)
			self?.expyDelegate?.tableView?(tableView, expyState: (type == .expand ? .didExpand : .didCollapse), changeForSection: section)
		}

		self.beginUpdates()

		//Don't insert or delete anything if section has only 1 cell.
		if let sectionRowCount = expyDataSource?.tableView(tableView, numberOfRowsInSection: section), sectionRowCount > 1 {
			
			var indexesToProcess: [IndexPath] = []
			
			//Start from 1, because 0 is the header cell.
			for row in 1..<sectionRowCount {
				indexesToProcess.append(IndexPath(row: row, section: section))
			}
			
			//Expand means inserting rows, collapse means deleting rows.
			if type == .expand {
				self.insertRows(at: indexesToProcess, with: expandingAnimation)
			}else if type == .collapse {
				self.deleteRows(at: indexesToProcess, with: collapsingAnimation)
			}
		}
		self.endUpdates()
		
		CATransaction.commit()
	}
}

extension ExpyTableView: UITableViewDataSource {
	open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		//If canExpandSections delegate method is not implemented, it defaults to true.
		let sectionIsExpandable = expyDataSource?.canExpand?(section: section, inTableView: self) ?? true
		let sectionIsVisible = visibleSections[section] ?? false
		let numberOfRows = expyDataSource?.tableView(self, numberOfRowsInSection: section) ?? 0
		
		guard sectionIsExpandable else {
			expandableSections[section] = false
			return numberOfRows
		}
		
		guard numberOfRows != 0 else {
			return 0
		}
		
		expandableSections[section] = true
		return sectionIsVisible ? numberOfRows : 1
	}
	
	open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let sectionIsExpandable = expandableSections[indexPath.section] ?? false
		
		guard sectionIsExpandable, indexPath.row == 0 else {
			return expyDataSource!.tableView(tableView, cellForRowAt: indexPath)
		}

		return expyDataSource!.expandableCell(forSection: indexPath.section, inTableView: self)
	}
}

extension ExpyTableView: UITableViewDelegate {
	
	open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let sectionIsExpandable = expandableSections[indexPath.section] ?? false
		let sectionIsVisible = visibleSections[indexPath.section] ?? false
		
		expyDelegate?.tableView?(tableView, didSelectRowAt: indexPath)
		
		guard sectionIsExpandable, indexPath.row == 0 else { return }
		sectionIsVisible ? collapse(indexPath.section, inTableView: self) : expand(indexPath.section, inTableView: self)
	}
}
