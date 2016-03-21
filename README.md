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
var elasticTextField = WWElasticTextField()
override func viewDidLoad() {
  super.viewDidLoad()

  // customization
  elasticTextField.overshootAmount = 30.0
  // ...
}
```

#### In interface builder
##### Set up

<p>
  <img src="https://github.com/shuuchen/WWElasticTextField/blob/master/setup.gif" height="438" width="250" />
</p>

##### Customize

<p>
  <img src="https://github.com/shuuchen/WWElasticTextField/blob/master/customize.gif" height="438" width="250" />
</p>

## Tutorial
https://www.raywenderlich.com/100939/how-to-create-an-elastic-animation-with-swift

## License
Released under the MIT license. See LICENSE for details.
