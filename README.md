# ExpyTableView

[![Version](https://img.shields.io/cocoapods/v/ExpyTableView.svg?style=flat)](http://cocoapods.org/pods/ExpyTableView)
[![License](https://img.shields.io/cocoapods/l/ExpyTableView.svg?style=flat)](http://cocoapods.org/pods/ExpyTableView)
[![Platform](https://img.shields.io/cocoapods/p/ExpyTableView.svg?style=flat)](http://cocoapods.org/pods/ExpyTableView)

## About

ExpyTableView is a re-write based on [SLExpandableTableView](https://github.com/OliverLetterer/SLExpandableTableView). Takes some ideas, concepts and codes and regenerates them in Swift. Lets you create expandable table views as easily as its ancestor. 

With **ExpyTableView**, you make an expandable table view by using multiple cells and inserting/deleting them(which can mean expanding and collapsing). With this approach, you will have a great chance in future design requests. All you will have to do is adding a new UITableViewCell and writing the code for it. You will easily have the new design.

## Requirements

- iOS 8.0+
- Swift 3.0+

## Installation

ExpyTableView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ExpyTableView'
```

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
    // this cell will be displayed at IndexPath with section: section and row 0
  }
} 
```

You are ready to go with the setup above. 

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
**(Don't forget to set delegate for your table view to receive callbacks for any UITableViewDelegate or ExpyTableViewDelegate methods)** 
//expandableTableView.delegate = self

```swift
extension ViewController: ExpyTableViewDelegate {

  //OPTIONAL DELEGATE METHOD, receives callbacks just before a section will expand or collapse
  func expyTableViewWillChangeState(withType type: ExpyActionType, forSection section: Int, inTableView tableView: ExpyTableView) {

    switch type {
      case .expand:
      print("WILL EXPAND")

      case .collapse:
      print("WILL COLLAPSE")
    }
  }

  //OPTIONAL DELEGATE METHOD, receives callbacks just after a section did expand or collapse
  func expyTableViewDidChangeState(withType type: ExpyActionType, forSection section: Int, inTableView tableView: ExpyTableView) {

    switch type {
    case .expand:
    print("DID EXPAND")

    case .collapse:
    print("DID COLLAPSE")

    }
  }
} 
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

## Result 

<img src="https://github.com/okhanokbay/ExpyTableView/blob/master/Example/customization_example.png" width=300> <img src="https://github.com/okhanokbay/ExpyTableView/blob/master/Example/sample_screen.png" width=300>

## License

ExpyTableView is available under the MIT license. See the LICENSE file for more info.
