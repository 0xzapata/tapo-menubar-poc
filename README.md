# tapo-menubar-poc

A macOS menu bar app that shows the live RTSP stream of a TP-Link Tapo camera.

## Prepare the camera

1. In the Tapo app, open the camera.
2. Go to Advanced Settings, then Camera Account. Create a user name and password.
3. Give the camera a fixed IP address in your router.

The camera then serves video at `rtsp://USER:PASS@CAMERA_IP:554/stream1` (HD) and `/stream2` (SD).

## Build and run

Requirements: macOS 13 or later, Xcode 15 or later.

```sh
swift build -c release
.build/release/TapoMenubar
```

Or open `Package.swift` in Xcode and run the `TapoMenubar` scheme.

Click the camera icon in the menu bar. Enter your RTSP URL in the text field. The stream starts after a few seconds.

## Limits

- The app plays only one stream.
- The Mac must be on the same network as the camera, or on a VPN to that network.
- Some Tapo firmware versions permit only one or two RTSP viewers at the same time.
- Swift Package Manager must download the VLCKit binary. The first build needs an internet connection.
