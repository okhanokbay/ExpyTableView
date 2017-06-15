# ExpyTableView

[![Version](https://img.shields.io/cocoapods/v/ExpyTableView.svg?style=flat)](http://cocoapods.org/pods/ExpyTableView)
[![License](https://img.shields.io/cocoapods/l/ExpyTableView.svg?style=flat)](http://cocoapods.org/pods/ExpyTableView)
[![Platform](https://img.shields.io/cocoapods/p/ExpyTableView.svg?style=flat)](http://cocoapods.org/pods/ExpyTableView)

## About
ExpyTableView is a re-write based on [SLExpandableTableView](https://github.com/OliverLetterer/SLExpandableTableView). Takes some ideas, concepts and codes and regenerates them in Swift. Lets you create expandable table views as easily as its descendant. 

## How to use

All you have to do is to implement this method and return your expanding cell from it. You are ready to go.

```swift
func expandingCell(forSection section: Int, inTableView tableView: ExpyTableView) -> UITableViewCell {
    // this cell will be displayed at IndexPath with section: section and row 0
}
```

## Result 

<img src="https://github.com/okhanokbay/ExpyTableView/Screenshots/sample_screen.png">

## Example

To run the example project, just download the project and open the xcworkspace file in Example folder.


## Installation

ExpyTableView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ExpyTableView', '~> 0.1.0'
```

## License

ExpyTableView is available under the MIT license. See the LICENSE file for more info.
