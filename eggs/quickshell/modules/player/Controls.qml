import QtQuick.Layouts
import qs.services
import qs.components
import qs.services
import qs.config

RowLayout {
    spacing: 48

    BaseButton {
        onPressed: Media.previous()
        IconifyIcon {
            set: Icons.set
            icon: Icons.previousTrack
            color: Theme.base16
        }
    }

    BaseButton {
        onPressed: Media.next()
        IconifyIcon {
            set: Icons.set
            icon: Icons.nextTrack
            color: Theme.base16
        }
    }

    BaseButton {
        onPressed: Media.toggle()
        IconifyIcon {
            set: Icons.set
            icon: Media.active.isPlaying ? Icons.pause : Icons.play
            color: Theme.base0B
        }
    }

    BaseButton {
        IconifyIcon {
            set: Icons.set
            icon: Icons.likeTrack
            color: Theme.base08
        }
    }
}
