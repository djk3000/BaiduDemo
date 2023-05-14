//
//  BaiduDemoApp.swift
//  BaiduDemo
//
//  Created by 邓璟琨 on 2023/2/8.
//

import SwiftUI

@main
struct BaiduDemoApp: App{
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate, BMKGeneralDelegate, BMKLocationAuthDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        // 要使用百度地图，请先启动BMKMapManager
        let mapManager = BMKMapManager()
        // 启动引擎并设置AK并设置delegate
        if !(mapManager.start("EzykQ9LK3EtekENuQ9aCf1itWG4krqfq", generalDelegate: self)) {
            NSLog("启动引擎失败")
        }
        
        BMKLocationAuth.sharedInstance().checkPermision(withKey: "EzykQ9LK3EtekENuQ9aCf1itWG4krqfq", authDelegate: self)
        BMKLocationAuth.sharedInstance().setAgreePrivacy(true)
        
        if BMKMapManager.setCoordinateTypeUsedInBaiduMapSDK(BMK_COORD_TYPE.COORDTYPE_COMMON) {
            NSLog("经纬度类型设置成功")
        } else {
            NSLog("经纬度类型设置失败")
        }
    
        return true
    }
}
