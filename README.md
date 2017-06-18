# ExpyTableView

[![Version](https://img.shields.io/cocoapods/v/ExpyTableView.svg?style=flat)](http://cocoapods.org/pods/ExpyTableView)
[![License](https://img.shields.io/cocoapods/l/ExpyTableView.svg?style=flat)](http://cocoapods.org/pods/ExpyTableView)
[![Platform](https://img.shields.io/cocoapods/p/ExpyTableView.svg?style=flat)](http://cocoapods.org/pods/ExpyTableView)

## About
ExpyTableView is a re-write based on [SLExpandableTableView](https://github.com/OliverLetterer/SLExpandableTableView). Takes some ideas, concepts and codes and regenerates them in Swift. Lets you create expandable table views as easily as its descendant. 

## How to use

First of all, if you are using Interface Builder, set your table view's class and module as ExpyTableView.'

<img src="https://github.com/okhanokbay/ExpyTableView/blob/master/Example/setting_class_and_module.png">

Then start implementing required methods:

```swift
class ViewController: ExpyTableViewDataSource, ExpyTableViewDelegate {

  @IBOutlet weak var expandableTableView: ExpyTableView!

  // First, set data source and delegate for your table view.
  override func viewDidLoad() {
    super.viewDidLoad() 
    expandableTableView.dataSource = self
    expandableTableView.delegate = self
  }
  
  // Then return your expandable cell instance from expandingCell data source method.
  func expandingCell(forSection section: Int, inTableView tableView: ExpyTableView) -> UITableViewCell {
    // this cell will be displayed at IndexPath with section: section and row 0
  }
} 
```

You are ready to go with the setup above. But you can improve the implementation: 

```swift
extension ViewController{

  //OPTIONAL DATA SOURCE METHOD, Default is true for all sections.
  func canExpand(section: Int, inTableView tableView: ExpyTableView) -> Bool {
    return true //Return false if you want your section not to be expandable
  }

  //OPTIONAL DELEGATE METHOD, Receive callbacks just before a section will expand or collapse
  func expyTableViewWillChangeState(withType type: ExpyActionType, forSection section: Int, inTableView tableView: ExpyTableView, animated: Bool) {

    switch type {
    case .expand:
    print("WILL EXPAND")

    case .collapse:
    print("WILL COLLAPSE")
    
  }
}

  //OPTIONAL DELEGATE METHOD, Receive callbacks just after a section did expand or collapse
  func expyTableViewDidChangeState(withType type: ExpyActionType, forSection section: Int, inTableView tableView: ExpyTableView, animated: Bool) {

    switch type {
    case .expand:
    print("DID EXPAND")

    case .collapse:
    print("DID COLLAPSE")

    }
  }
} 
```

If a data source or delegate method is not being implemented by ExpyTableView, then it forwards them to its subclass. Thus, you will get callback for any other table view data source or delegate methods. You don't have to conform UITableViewDataSource or UITableViewDelegate, just conform to ExpyTableViewDataSource and ExpyTableViewDelegate and they will  forward you any unhandled methods.

```swift
extension ViewController{
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("DID SELECT row: \(indexPath.row), section: \(indexPath.section)")
  }
}
```

See example code for more details and implementation examples.

## Example

To run the example project, just download the project and open the xcworkspace file in Example folder.


## Installation

ExpyTableView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ExpyTableView', '~> 0.1.0'
```

## Result 

<img src="https://github.com/okhanokbay/ExpyTableView/blob/master/Example/customization_example.png"> <img src="https://github.com/okhanokbay/ExpyTableView/blob/master/Example/sample_screen.png">

## License

ExpyTableView is available under the MIT license. See the LICENSE file for more info.
