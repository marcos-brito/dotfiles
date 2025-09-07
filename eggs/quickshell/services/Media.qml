pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Mpris

Singleton {
    readonly property list<MprisPlayer> players: Mpris.players.values
    property MprisPlayer active: players[0]

    function setActive(identity: string): void {
        active = players.find(player => player.identity == identity);
    }

    function identities(): list<string> {
        return players.map(player => player.identity);
    }

    function toggle(): void {
        if (active?.canTogglePlaying)
            active.togglePlaying();
    }

    function next(): void {
        if (active?.canGoNext)
            active.next();
    }

    function previous(): void {
        if (active?.canGoPrevious)
            active.next();
    }
}
