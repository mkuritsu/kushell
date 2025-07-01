import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import "root:/config"

Row {
    spacing: 5

    Text {
        color: "#7FBBB3"
        text: `${Pipewire.defaultAudioSink == null ? 0 : Math.round(Pipewire.defaultAudioSink.audio.volume * 100)}% `
        font.pixelSize: ShellConfig.fontSize
        font.family: ShellConfig.fontFamily
    }
    
    Text {
        color: "#7FBBB3"
        text: `${Pipewire.defaultAudioSource == null ? 0 : Math.round(Pipewire.defaultAudioSource.audio.volume * 100)}% `
        font.pixelSize: ShellConfig.fontSize
        font.family: ShellConfig.fontFamily
    }

    PwObjectTracker {
        objects: [Pipewire.defaultAudioSink, Pipewire.defaultAudioSource]
    }
}
