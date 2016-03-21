# WWElasticTextField
UITextField with elastic bounce effect.

<p>
  <img src="https://github.com/shuuchen/WWElasticTextField/blob/master/elastic.gif" height="438" width="250" />
</p>

## Requirements

* Xcode 7+
* iOS 8.0+
* ARC
* Swift 2.0+

## Installation

#### CocoaPods

```ruby
use_frameworks!
pod "WWElasticTextField"
```

## Usage

Simply replace UITextField with WWElasticTextField in source code or interface builder.

#### In source code
```swift
import WWElasticTextField

override func viewDidLoad() {
  super.viewDidLoad()

  /* ... */

  /* initialize */
  let elasticTextField = WWElasticTextField(frame: CGRectMake(0, 0, 97, 30))
        
  /* set position */
  elasticTextField.center = view.center
        
  /* customize */
  elasticTextField.overshootAmount = 30
        
  /* add to super view */
  view.addSubview(elasticTextField)

  /* ... */
}
```

#### In interface builder
##### Set up
Drag a new UITextView from object library and set its custom class to be WWElasticTextField.

<p>
  <img src="https://github.com/shuuchen/WWElasticTextField/blob/master/setup.gif" width="30%" />
</p>

##### Customize
Play with the value of overshootAmount and see how the elastic extent changes accordingly.

<p>
  <img src="https://github.com/shuuchen/WWElasticTextField/blob/master/customize.gif" width="30%" />
</p>

## Tutorial
https://www.raywenderlich.com/100939/how-to-create-an-elastic-animation-with-swift

## License
Released under the MIT license. See LICENSE for details.
