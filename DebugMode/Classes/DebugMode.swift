//
//  DebugMode.swift
//  DebugMode
//
//  Created by Esteban PASQUIER on 08/12/2017.
//

import Foundation

public protocol DebugModeReactive {
    func subscribeToDebugModeChanged()
    func didChangeDebugMode(_ debugModeEnable: Bool)
    func unsubsribeToDebugModeChanged()
}

let kDebugModelEnableNotification = "debugModeEnabled"

extension DebugModeReactive{
    public func subscribeToDebugModeChanged() {
        NotificationCenter.default.addObserver(forName: Notification.Name.DebugModeDidChange, object: nil, queue: nil) { (notification) in
            if let debugModeEnabled = notification.userInfo?[kDebugModelEnableNotification] as? Bool {
                self.didChangeDebugMode(debugModeEnabled)
            }
        }
    }
    
    public func unsubsribeToDebugModeChanged(){
        NotificationCenter.default.removeObserver(self, name: Notification.Name.DebugModeDidChange, object: nil)
    }
}

extension Notification.Name {
    public static var DebugModeDidChange : Notification.Name { return Notification.Name("Notification-DebugMode-DidChange") }
}

