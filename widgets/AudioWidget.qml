import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire

Row {
    spacing: 5

    Text {
        color: "#94e2d5"
        text: `${Pipewire.defaultAudioSink == null ? 0 : Math.round(Pipewire.defaultAudioSink.audio.volume * 100)}% `
        font.pixelSize: 14
        font.family: "jetbrains mono nf"
    }
    
    Text {
        color: "#94e2d5"
        text: `${Pipewire.defaultAudioSource == null ? 0 : Math.round(Pipewire.defaultAudioSource.audio.volume * 100)}% `
        font.pixelSize: 14
        font.family: "jetbrains mono nf"
    }

    PwObjectTracker {
        objects: [Pipewire.defaultAudioSink, Pipewire.defaultAudioSource]
    }
}
