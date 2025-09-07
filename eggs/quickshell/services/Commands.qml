pragma Singleton

import Quickshell.Services.Pipewire
import Quickshell
import qs.config

Singleton {
    id: root
    property PwNode node: Pipewire.defaultAudioSource

    PwObjectTracker {
        objects: [root.node]
    }

    readonly property var commands: [
        {
            name: "Mute",
            desc: "Mutes the audio",
            icon: Icons.audioMuted,
            action: () => node.audio.muted = true
        },
        {
            name: "Unmute",
            desc: "Unmutes the audio",
            icon: Icons.audio,
            action: () => node.audio.muted = false
        },
        {
            name: "Run",
            desc: "Opens the application picker",
            icon: "rocket",
            action: () => Panels.open("app-picker")
        },
        {
            name: "Lock",
            desc: "Locks the current session",
            icon: Icons.lock,
            action: () => Panels.open("app-picker")
        },
        {
            name: "Logout",
            desc: "Logs out of the current session",
            icon: Icons.logout,
            action: () => Panels.open("app-picker")
        },
        {
            name: "Shutdown",
            desc: "Shuts the machine down",
            icon: Icons.shutdown,
            action: () => Panels.open("app-picker")
        },
        {
            name: "Reboot",
            desc: "Reboots the machine",
            icon: Icons.reboot,
            action: () => Panels.open("app-picker")
        }
    ]
}
