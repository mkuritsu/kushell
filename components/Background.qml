import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import "root:/config"

LazyLoader {
    id: backgroundLoader
    active: true

    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property ShellScreen modelData
            
            id: panel
            screen: modelData
            anchors {
                top: true
                bottom: true
                left: true
                right: true
            }
            WlrLayershell.exclusionMode: ExclusionMode.Ignore
            WlrLayershell.layer: WlrLayer.Background
                    
            Image {
                id: wallpaper
                asynchronous: true
                anchors.fill: parent
                fillMode: Image.PreserveAspectCrop
                source: ShellConfig.wallpaperPath
                Image{
                    id: default_img
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectCrop
                    source: "root:/assets/wallpaper.jpg"
                    visible: wallpaper.status != Image.Ready 
                }
            }
        }
    }
}