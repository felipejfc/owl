![](http://img.shields.io/cocoapods/p/Owl.svg?style=flat)
![](http://img.shields.io/cocoapods/v/Owl.svg?style=flat)
![](http://img.shields.io/cocoapods/l/Owl.svg?style=flat)
[![](https://travis-ci.org/felipejfc/owl.svg?branch=master)](https://travis-ci.org/felipejfc/owl/builds)
[![Join the chat at https://gitter.im/felipejfc/owl](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/felipejfc/owl?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

#Owl

Secure, simple key-value storage for iOS

<img src='http://spectrumtab.com/wp-content/uploads/2013/01/Owl-Logo.jpg' width='190' height='128'/>

Owl uses:
- RNCryptor (AES) for the crypto
- NSUserDefaults for the persistent storage
- AutoCoding
- GZIP for compression

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
[Owl putObject:object withKey:@"key"];
```

#### Get
```objective-c
T * object = [Owl getObjectWithKey:@"key"];
```

#### Remove
```objective-c
[Owl removeObjectWithKey:@"key"]
```

#### Contains
```objective-c
BOOL ret = [Owl containsKey:@"key"];
```

##### More samples for save

```objective-c
[Owl putObject:[NSArray arrayWithObjects:object1, object2,...] withKey:@"a"]; //save array
[Owl putObject:@"Hello" withKey:@"b"]; //save string
[Owl putObject:[NSNumber numberWithInt:1] withKey:@"c"]; //save number
[Owl putObject:[[Foo alloc] init] withKey:@"d"]; //save an object
```

##### More samples for get

```objective-c
NSArray * value = [Owl getObjectWithKey:@"a"]; //load array
NSString * value = [Owl getObjectWithKey:@"b"]; //load string
NSNumber * value = [Owl getObjectWithKey:@"c"]; //load number
Foo * value = [Owl getObjectWithKey:@"d"]; //load an object
```

###Encryption

Owl uses AES encryption over the data to save it securely, all the security methods are written in
pure C so that is it way harder to intercept them.

###Compatibility

Owl can persist **everything that subclasses NSObject**, assuming that all the properties of
this object also do or are primitives.
You should only avoid using structs that are not already NSCoding-compliant via NSValue.

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
