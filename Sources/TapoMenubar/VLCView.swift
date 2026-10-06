import SwiftUI
import VLCKit

struct VLCView: NSViewRepresentable {
    let url: String

    func makeNSView(context: Context) -> NSView {
        let view = NSView()
        context.coordinator.player.drawable = view
        return view
    }

    func updateNSView(_ nsView: NSView, context: Context) {
        let player = context.coordinator.player
        guard let media = URL(string: url), player.media?.url != media else { return }
        player.stop()
        player.media = VLCMedia(url: media)
        // ponytail: TCP transport only, UDP drops frames on Wi-Fi.
        player.media?.addOption(":rtsp-tcp")
        player.play()
    }

    func makeCoordinator() -> Coordinator { Coordinator() }

    final class Coordinator {
        let player = VLCMediaPlayer()
        deinit { player.stop() }
    }
}
