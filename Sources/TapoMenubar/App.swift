import SwiftUI

@main
struct TapoMenubarApp: App {
    @AppStorage("rtspURL") private var rtspURL = "rtsp://USER:PASS@192.168.1.50:554/stream2"

    var body: some Scene {
        MenuBarExtra("Tapo", systemImage: "video.fill") {
            VStack(spacing: 8) {
                VLCView(url: rtspURL)
                    .frame(width: 480, height: 270)
                TextField("rtsp://user:pass@ip:554/stream2", text: $rtspURL)
                    .textFieldStyle(.roundedBorder)
                Button("Quit") { NSApplication.shared.terminate(nil) }
            }
            .padding(8)
        }
        .menuBarExtraStyle(.window)
    }
}
