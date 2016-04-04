Digest
========

[![Swift 3.0](https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![Platforms Linux](https://img.shields.io/badge/Platforms-Linux-lightgray.svg?style=flat)](https://developer.apple.com/swift/)
[![License MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=flat)](https://tldrlegal.com/license/mit-license)
[![Slack Status](https://zewo-slackin.herokuapp.com/badge.svg)](http://slack.zewo.io)

## Status

- [x] SHA1
- [ ] SHA2
- [ ] MD5

## Usage

#### SHA1

```swift
let sha1: String = Digest.sha1("Hello, world!")
```

## Installation

```swift
import PackageDescription

let package = Package(
	dependencies: [
		.Package(url: "https://github.com/Zewo/Digest.git", majorVersion: 0, minor: 0)
	]
)

```

## Community

[![Slack](http://s13.postimg.org/ybwy92ktf/Slack.png)](http://slack.zewo.io)

Join us on [Slack](http://slack.zewo.io).

License
-------

**Digest** is released under the MIT license. See LICENSE for details.

SHA1 Algorithm Copyright (C) 2014 Marcin Krzyżanowski <marcin.krzyzanowski@gmail.com>
