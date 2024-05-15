# Contribution Guidelines

## Questions

If you are having difficulties using `LifoContainers` or have a question about usage, please ask a question by creating [a new issue](https://github.com/AlexLevshenkov/LifoContainers/issues/new). 

## Reporting New Issues

1. **Make sure you're on the latest version.** Update to the most recent master release if possible. We may have already fixed your bug. Upgrading is always the best first step.
2. **Search for similar [issues](https://github.com/AlexLevshenkov/LifoContainers/issues) before opening any new issues.** It's possible somebody has encountered this bug already. Please add a comment to the existing issue instead of opening a new one.
3. **Use a clear and descriptive title** for the issue.
4. **Describe the exact steps to reproduce the problem** in as many details as possible.
4. **Provide code samples.**
5. **Include screenshots and animated GIFs** which could clearly demonstrate the problem.
6. **Explain which behaviour you expect to see and why.**
7. **Provide information about your environment.**
    - `LifoContainers` version
    - OS version
    - Xcode version

## Contributing Changes

Before submitting a pull request, please search for [an open or closed pull request](https://github.com/AlexLevshenkov/LifoContainers/pulls) that relates to your submission.

When creating a pull request please consider following:

- **Always make a new branch** for your work. This makes it easier for others to take just one set of changes form your repository.
- **Follow our code style.** [SwiftFormat and SwiftLint](#code-linters-requirements) can do all work for you. You can run a script that can do all work for you:
    ```bash
    chmod u+x ./scripts/run-linters.sh
    ./scripts/run-linters.sh
    ```

    You can find configuration for **SwiftFormat** and **SwiftLint** in the [configs](./configs/) folder.

- **Please do not submit unrelated changes** in the same pull request.
- **Use a clear and descriptive title** for the pull request.
- **Describe a clear list of things** that you have done in this pull request.
- **Include relevant issue number** if applicable.
- **Consider adding unit tests.** We'd be really grateful if you add unit test for your feature/bugfix!

### Code linters requirements

- [SwiftFormat 0.53.8+](https://github.com/nicklockwood/SwiftFormat)
- [SwiftLint 0.53.0+](https://github.com/realm/SwiftLint)
