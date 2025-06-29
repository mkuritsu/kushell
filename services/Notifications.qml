pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Notifications

Singleton {
    id: root

    signal notification(notification: Notification)

    property var notifications: notificationServer.trackedNotifications

    NotificationServer {
        id: notificationServer
        keepOnReload: false
        actionsSupported: true
        bodyHyperlinksSupported: true
        bodyImagesSupported: true
        bodyMarkupSupported: true
        imageSupported: true
        onNotification: notification => {
            notification.tracked = true
            root.notification(notification)
        }
    }
}