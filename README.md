# ExpyTableView

[![Version](https://img.shields.io/cocoapods/v/ExpyTableView.svg?style=flat)](http://cocoapods.org/pods/ExpyTableView)
[![License](https://img.shields.io/cocoapods/l/ExpyTableView.svg?style=flat)](http://cocoapods.org/pods/ExpyTableView)
[![Platform](https://img.shields.io/cocoapods/p/ExpyTableView.svg?style=flat)](http://cocoapods.org/pods/ExpyTableView)

## About

ExpyTableView is a re-write based on [SLExpandableTableView](https://github.com/OliverLetterer/SLExpandableTableView). Takes some ideas, concepts and codes and regenerates them in Swift. Lets you create expandable table views as easily as its ancestor. 

With **ExpyTableView**, you make an expandable table view by using multiple cells and inserting/deleting them(which can mean expanding and collapsing). With this approach, you will have a great chance in future design requests. All you will have to do is adding a new UITableViewCell and writing the code for it. You will easily have the new design.

## ScreenShots 

<img src="https://github.com/okhanokbay/ExpyTableView/blob/master/Example/customization_example_0.3.0.png" width=300> <img src="https://github.com/okhanokbay/ExpyTableView/blob/master/Example/sample_screen_0.3.0.png" width=300>

## Requirements

- iOS 8.0+
- Swift 3.0+

## Installation

ExpyTableView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ExpyTableView'
```
Or you can manually drag and drop the ExpyTableViewCell.swift to your project, then use it.

## How to use

First of all, if you are using Interface Builder, set your table view's class and module as ExpyTableView.'

<img src="https://github.com/okhanokbay/ExpyTableView/blob/master/Example/setting_class_and_module.png">

Then start implementing required methods:

```swift
class ViewController: ExpyTableViewDataSource {

@IBOutlet weak var expandableTableView: ExpyTableView!

  // First, set data source for your table view.
  override func viewDidLoad() {
    super.viewDidLoad() 
    expandableTableView.dataSource = self
    //Set delegate if you will implement any UITableViewDelegate or ExpyTableViewDelegate methods.
    //expandableTableView.delegate = self 
  }

  // Then return your expandable cell instance from expandingCell data source method.
  func expandableCell(forSection section: Int, inTableView tableView: ExpyTableView) -> UITableViewCell {
    // This cell will be displayed at IndexPath with (section: section and row: 0)
  }
} 
```

**You are ready to go with the setup above.**

If you want, you can improve the implementation: 

```swift
extension ViewController {
  //OPTIONAL DATA SOURCE METHOD, default is true for all sections.
  func canExpand(section: Int, inTableView tableView: ExpyTableView) -> Bool {
    return true //Return false if you want your section not to be expandable
  }
}
```

You can use optional delegate methods:

```swift
extension ViewController: ExpyTableViewDelegate {

  //OPTIONAL DELEGATE METHOD, receives callbacks when a section will expand, will collapse, did expand, did collapse. A unified method.
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

  //OPTIONAL DELEGATE METHOD, if you conform to this in your header cell (which is section: section and row: 0) you will get state change notifications
  //changeState method has a cellReuse parameter to allow you to prepare your cell for reusing. 
  //All state info is allocated by ExpyTableView.

class YourTableViewCell: UITableViewCell, ExpyTableViewHeaderCell{

  func changeState(_ state: ExpyState, cellReuseStatus cellReuse: Bool) {

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
```

You can manually expand or collapse any section like below:

```swift
expandableTableView.expand(0) //Expand first section manually
expandableTableView.collapse(0) //Collapse first section manually
```

You will get callbacks for all of the **UITableViewDataSource** or **UITableViewDelegate** methods. Just conform to **ExpyTableViewDataSource** and **ExpyTableViewDelegate** and they will forward you all the methods you need.

```swift
extension ViewController{

  //All of the UITableViewDataSource and UITableViewDelegate methods will be forwarded to you right as they are.
  //Here you can see two examples below.
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("DID SELECT row: \(indexPath.row), section: \(indexPath.section)")
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableViewAutomaticDimension
  }
}
```

See example code for more details and implementation examples.

## Example

To run the example project, just download the project and open the xcworkspace file in Example folder.

## License

ExpyTableView is available under the MIT license. See the LICENSE file for more info.
