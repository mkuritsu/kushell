pragma Singleton

import Quickshell
import Quickshell.Services.Pipewire

Singleton {
  readonly property PwNode defaultSink: Pipewire.defaultAudioSink
  readonly property PwNode defaultSource: Pipewire.defaultAudioSource

  PwObjectTracker {
    objects: [Pipewire.defaultAudioSink, Pipewire.defaultAudioSource]
  }
}
