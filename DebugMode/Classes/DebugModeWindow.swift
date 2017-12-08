//
//  DebugModeWindow.swift
//  DebugMode
//
//  Created by Esteban PASQUIER on 08/12/2017.
//

import Foundation
import FLEX

public class DebugModeWindow : UIWindow, DebugModeReactive {
    
    private var isDebugModeEnabled = false
    
    override public var canBecomeFirstResponder: Bool {
        return true
    }
    override public func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake{
            self.deviceDidShake()
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.subscribeToDebugModeChanged()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.subscribeToDebugModeChanged()
    }
    
    deinit {
        self.unsubsribeToDebugModeChanged()
    }
    
    public func didChangeDebugMode(_ debugModeEnable: Bool) {
        self.layer.borderWidth = debugModeEnable ? 3.0 : 0.0
        self.layer.borderColor = debugModeEnable ? UIColor.orange.cgColor : UIColor.clear.cgColor
        UIApplication.shared.setStatusBarHidden(debugModeEnable, with: .slide)
        if debugModeEnable {
            UINavigationBar.appearance().tintColor = .black
            let uibutton = UIButton(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 20))
            uibutton.tag = 1234//To be able to remove it
            uibutton.setTitle("Debug Mode Enabled ", for: .normal)
            uibutton.setTitleColor(.black, for: .normal)
            uibutton.titleLabel?.textAlignment = .center
            uibutton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
            uibutton.backgroundColor = UIColor(cgColor: self.layer.borderColor!)
            
            uibutton.addTarget(self, action: #selector(debugButtonTouchUpInside(_:)), for: .touchUpInside)
            
            self.addSubview(uibutton)
        }
        else{
            UINavigationBar.appearance().tintColor = .clear
            if let uibutton = self.viewWithTag(1234) {
                uibutton.removeFromSuperview()
            }
        }
    }
    
    @objc func debugButtonTouchUpInside(_ sender: UIButton){
        FLEXManager.shared().isHidden ? FLEXManager.shared().showExplorer() : FLEXManager.shared().hideExplorer()
    }
    
    func deviceDidShake() {
        isDebugModeEnabled = !isDebugModeEnabled
        NotificationCenter.default.post(name: Notification.Name.DebugModeDidChange, object: nil,userInfo : [kDebugModelEnableNotification:isDebugModeEnabled])
    }
}
