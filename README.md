# LifoContainers

Library containing various flavours of Last-In-First-Out (LIFO) data structures.

## Contents

- [Requirements](#requirements)
- [Build `.xcframework` by yourself](#build-xcframework-by-yourself)
- [Versioning](#versioning)
- [Contributing](#contributing)
- [License](#license)

## Requirements

- iOS 12.0+ / macOS 10.13+
- Xcode 15.2+
- Swift 5.9+

## Build `.xcframework` by yourself

You may want to build the binary `.xcframework` file yourself from the source code. To do so you need to run the `build-xcframework.sh` script in a [scripts](./scripts/) folder or you may follow [instructions](https://developer.apple.com/documentation/xcode/creating-a-multi-platform-binary-framework-bundle#Create-archives-for-frameworks-or-libraries) provided by Apple.

## Versioning

`LifoContainers` follows [semantic versioning 2.0.0](https://semver.org/). We release patch versions for bug fixes, minor versions for new features (and rarely, clear and easy to fix breaking changes), and major versions for any major breaking changes. When we make breaking changes, we also introduce deprecation warnings in a minor version so that our users learn about the upcoming changes and migrate their code in advance.

## Contributing

We welcome any contributions. See the [CONTRIBUTING.md](./CONTRIBUTING.md) file for how to get involved.

## License

This project is licensed under the [MIT License](./LICENSE).
