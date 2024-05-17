# LifoContainers

Library containing various flavours of Last-In-First-Out (LIFO) data structures.

## Contents

- [Requirements](#requirements)
- [Build `.xcframework` by yourself](#build-xcframework-by-yourself)
- [Demo application](#demo-application)
- [Versioning](#versioning)
- [Contributing](#contributing)
- [License](#license)

## Requirements

- iOS 12.0+ / macOS 10.13+
- Xcode 15.2+
- Swift 5.9+

## Build `.xcframework` by yourself

You may want to build the binary `.xcframework` file yourself from the source code. To do so you need to run the `build-xcframework.sh` script in a [scripts](./scripts/) folder or you may follow [instructions](https://developer.apple.com/documentation/xcode/creating-a-multi-platform-binary-framework-bundle#Create-archives-for-frameworks-or-libraries) provided by Apple.

## Demo application

We have created a simple macOS [application](./DemoApp/) called `ParenthesesValidator` to demonstrate how to connect `LifoContainers` to your project and show an example of problems that could be solved using the `LifoContainers` API.

`ParenthesesValidator` checks if parentheses in the given string are paired. If you find it similar to leetcode problem ["20. Valid Parentheses"](https://leetcode.com/problems/valid-parentheses/description/) you are right! One of the ways to solve this problem relies on [stack](https://en.wikipedia.org/wiki/Stack_(abstract_data_type)) what exactly `LifoContainers` provides to you.

## Versioning

`LifoContainers` follows [semantic versioning 2.0.0](https://semver.org/). We release patch versions for bug fixes, minor versions for new features (and rarely, clear and easy to fix breaking changes), and major versions for any major breaking changes. When we make breaking changes, we also introduce deprecation warnings in a minor version so that our users learn about the upcoming changes and migrate their code in advance.

## Contributing

We welcome any contributions. See the [CONTRIBUTING.md](./CONTRIBUTING.md) file for how to get involved.

## License

This project is licensed under the [MIT License](./LICENSE).
