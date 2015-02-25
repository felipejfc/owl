![](http://img.shields.io/cocoapods/p/Owl.svg?style=flat)
![](http://img.shields.io/cocoapods/v/Owl.svg?style=flat)
![](http://img.shields.io/cocoapods/l/Owl.svg?style=flat)
[![Join the chat at https://gitter.im/felipejfc/owl](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/felipejfc/owl?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

#Owl

Secure, simple key-value storage for iOS

<img src='http://spectrumtab.com/wp-content/uploads/2013/01/Owl-Logo.jpg' width='190' height='128'/>

Owl uses:
- AES for the crypto
- NSUserDefaults for the persistent storage
- JSONModel

Owl provides:
- Secure data persistence
- Save almost any type

###Add pod
```groovy
pod 'Owl'
```
###Import  Owl
```#import "Owl.h"```
### Using Owl

#### Save
```objective-c
[Owl putWithKey:@"key" andValue:value];
```

#### Get
```objective-c
T * object = [Owl getWithKey:@"key" andClass:[T class]];
```

#### Remove
```objective-c
[Owl removeWithKey:@"key"]
```

#### Contains
```objective-c
BOOL ret = [Owl containsKey:@"key"];
```

##### More samples for save

```objective-c
[Owl putWithKey:@"key" andValue:@"Hello"]; //save string
[Owl putWithKey:@"key" andValue:[NSNumber numberWithInt:1]]; // save number
[Owl putWithKey:@"key" andValue:[[TestModel alloc] init]]; // save an object (must subclass OwlModel, see below)
```

##### More samples for get

```objective-c
NSString * value = [Owl getWithKey:@"key" andClass:[NSString class]];
NSNumber * value = [Owl getWithKey:@"key" andClass:[NSNumber class]];
Foo * value = [Owl getWithKey:@"key" andClass:[Foo class]];
```
###Compatibility

Owl can persist the following object types directly:
```
NSString, NSNumber, NSArray, NSDictionary or NSNull (for this types, All other 
objects in the hierarchy must be NSString, NSNumber, NSArray, NSDictionary or 
NSNull as well).
```

Owl can also persist custom Classes, but they **MUST** meet this requirements:
* Must subclass OwlModel, example:
```
@interface TestModel : OwlModel
    @property(nonatomic, strong) NSString *aSrt;
    @property(nonatomic) int num;
@end
```
* The classes of its properties must be either:
```
non-primitives
[NSString class], [NSNumber class], [NSDecimalNumber class], [NSArray class],
[NSDictionary class], [NSNull class], [NSMutableString class],
[NSMutableArray class], [NSMutableDictionary class]

primitives
@"BOOL", @"float", @"int", @"long", @"double", @"short",
@"NSInteger", @"NSUInteger",@"Block"
```
* It can also contain another object that also subclass OwlModel and respect all the constraints, for example: <br>
TestModel.h
```
#import "OwlModel.h"
#import "TestModel2.h"
@interface TestModel : OwlModel
@property(nonatomic, strong) NSString *aSrt;
@property(nonatomic, strong) TestModel2 *model;
@property(nonatomic) int num;
@end
```
TestModel2.h
```
#import "OwlModel.h"
@interface TestModel2 : OwlModel
@property(nonatomic) float numFloat;
@property(nonatomic) BOOL testBool;
@end
```
**note that primitives can be persisted, but only it they are properties of a class that subclasses OwlModel**

####Changing the AES encryption/decryption key
As I told, Owl uses AES encryption to securely keep data in NSUserDefaults, for doing so it uses a default key, you can change that key to one of your own by simply making this call:
```objective-c
[Owl setPassword:@"aaaasomePassword"];
```
Remember that, for AES encryption, key length must be 128, 192 or 256 bits long( 16, 24 or 32 chars)

###ToDo
* Tests
* Support for arrays
* Extend compatibility

###MIT License
<pre>
Copyright (c) 2015 Felipe Cavalcanti

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
</pre>
