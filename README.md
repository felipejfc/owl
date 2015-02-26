![](http://img.shields.io/cocoapods/p/Owl.svg?style=flat)
![](http://img.shields.io/cocoapods/v/Owl.svg?style=flat)
![](http://img.shields.io/cocoapods/l/Owl.svg?style=flat)
![](https://travis-ci.org/felipejfc/owl.svg?branch=master)
[![Join the chat at https://gitter.im/felipejfc/owl](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/felipejfc/owl?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

#Owl

Secure, simple key-value storage for iOS

<img src='http://spectrumtab.com/wp-content/uploads/2013/01/Owl-Logo.jpg' width='190' height='128'/>

Owl uses:
- RNCryptor (AES) for the crypto
- NSUserDefaults for the persistent storage
- AutoCoding
- GZIP for compression
- SSKeychain

Owl provides:
- Secure data persistence
- Save any object that subclasses NSObject

### Using Owl

###Add pod
```groovy
pod 'Owl'
```

###Import  Owl
```#import "Owl.h"```

#### Save
```objective-c
[Owl putWithKey:@"key" andValue:object];
```

#### Get
```objective-c
T * object = [Owl getWithKey:@"key"];
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
[Owl putWithKey:@"a" andValue:[NSArray arrayWithObjects:object1, object2,...]]; //save array
[Owl putWithKey:@"b" andValue:@"Hello"]; //save string
[Owl putWithKey:@"c" andValue:[NSNumber numberWithInt:1]]; // save number
[Owl putWithKey:@"d" andValue:[[Foo alloc] init]]; // save an object
```

##### More samples for get

```objective-c
NSArray * value = [Owl getWithKey:@"a"]; //load array
NSString * value = [Owl getWithKey:@"b"]; //load string
NSNumber * value = [Owl getWithKey:@"c"]; //load number
Foo * value = [Owl getWithKey:@"d"]; //load an object
```
###Compatibility

Owl can persist **everything that subclasses NSObject**, assuming that all the properties of
this object also do or are primitives.
You should only avoid using structs that are not already NSCoding-compliant via NSValue.

###Changing the AES encryption/decryption key
As I told, Owl uses AES encryption to securely keep data in NSUserDefaults, for doing so it uses a random generated key, you can change that key to one of your own by simply making this call:
```objective-c
[Owl setPassword:@"aaaasomePassword"];
```
Remember that, for AES encryption, key length must be 128, 192 or 256 bits long( 16, 24 or 32 chars)

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
