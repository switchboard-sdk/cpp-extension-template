# Switchboard SDK C++ Extension Template

> [!NOTE]
> To create a Switchboard SDK WebAudio extension, please check out [switchboard-sd/web-audio-extension-template](https://github.com/switchboard-sdk/web-audio-extension-template).

Welcome to the Switchboard SDK C++ Extension Template repository! This repository provides a starting point for developers looking to create C++ extensions for the Switchboard SDK. By using this template, you can quickly set up your development environment and begin building custom functionality for the Switchboard SDK.

| iOS  | macOS | JVM  | Android | Linux | Windows | Web |
|:-----|:------|:-----|:--------|:------|:--------|:----|
| :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | Coming soon | Coming soon | Coming soon | 


## Getting Started

The project name in this repo is set to `ExampleDSP`. To get started with your extension first run the rename script:

```bash
bash scripts/rename.sh
```

After renaming the project, you can run the following script to download the dependencies and generate the project files.

```bash
bash scripts/setup.sh
```

## Developing the Extension

Sample code is provided for the three different node types. Check out the following source files to get started:

- src/all/AudioGraphNodes/Source/ExampleSouceNode.cpp
- src/all/AudioGraphNodes/Processor/ExampleProcessorNode.cpp
- src/all/AudioGraphNodes/Sink/ExampleSinkNode.cpp

### iOS and macOS

Open the generated xcodeproj file.

### JVM

Open the jvm directory in IntelliJ IDEA.

### Android

Open the android 


### Web

Coming soon...

### Linux

Coming soon...

### Windows

Coming soon...


## Building the Extension

Run the following command to build the extension package for all platforms:

```bash
bash scripts/build.sh
```

Platform-specific build scripts are also provided.


## License

See the LICENSE.txt file for details.

## Contact

If you have any questions or need assistance with the Switchboard SDK or this template, please don't hesitate to contact us:

Email: [hello@synervoz.com](mailto:hello@synervoz.com)

Website: [https://docs.switchboard.audio](https://docs.switchboard.audio)

Happy coding! 🚀
