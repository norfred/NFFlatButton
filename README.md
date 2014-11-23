NFFlatButton
============

Custom flat button 'à la Letterpress' written in Swift.

**`NFFlatButton` is a subclass of `UIButton`, so it works as a normal button!**


![](https://raw.githubusercontent.com/norfred/NFFlatButton/master/docs/screenshots.png)

##How to use
1. Import `NFFlatButton.swift` to your project folder.
2. Initialize a `NFFlatButton` in `viewDidLoad()` method:
 ```swift
  override func viewDidLoad() {
        super.viewDidLoad()
        
        // Init a new NFFlatButton
        let flatButton: NFFlatButton = NFFlatButton(frame: CGRectMake(100.0, 128.0, 120.0, 36.0))
        
        // Set title and color
        flatButton.setTitle("Title", forState: .Normal)
        flatButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        
        // Add to view
        view.addSubview(flatButton)
    }
```
3. Done! 

##More Infos
Check example project for more explanation!

Need help? You can follow me on Twitter [@norfreds](https://twitter.com/Norfreds)

##License 

The MIT License (MIT)

Copyright (c) 2014 norfred

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
