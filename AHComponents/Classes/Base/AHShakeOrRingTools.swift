//
//  AHShakeOrRingTools.swift
//  AHComponents
//
//  Created by ByteDance on 2023/4/10.
//

import Foundation
import AVFAudio

public enum AHRingAndShakeType {
    case ring
    case shake
    case ringAndShake
}

public class AHShakeOrRingTools {
    public static let shared = AHShakeOrRingTools()
    
    // 响铃标识
    fileprivate var soundID = SystemSoundID()
    // 震动timer计时器
    fileprivate var endTimer = Timer()
    
    public func ringOrShake(type: AHRingAndShakeType, duration: TimeInterval?) {
        // 避免上次播放尚未结束
        stopRingAndShake()
        
        if (type == .ringAndShake || type == .ring),
            let path = AHTools.findSourceBundle().path(forResource: "ring", ofType: "mp3") {
            let url = NSURL(fileURLWithPath: path)
            AudioServicesCreateSystemSoundID(url, &soundID)
            AudioServicesAddSystemSoundCompletion(soundID, nil, nil, { soundID, _ in
                AudioServicesPlaySystemSound(soundID)
            }, nil)
            AudioServicesPlaySystemSound(soundID)
        }
        
        var durationStr: Double = duration ?? 1
        endTimer = Timer(timeInterval: 1, repeats: true, block: { [weak self] timer in
            if (type == .shake || type == .ringAndShake) {
                AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
            }
            if (durationStr <= 0) {
                self?.stopRingAndShake()
            } else {
                durationStr -= 1
            }
        })
        RunLoop.current.add(endTimer, forMode: .defaultRunLoopMode)
        // 开始计时
        endTimer.fire()
    }
    
    @objc
    public func stopRingAndShake() {
        endTimer.invalidate()
        AudioServicesRemoveSystemSoundCompletion(soundID)
        AudioServicesDisposeSystemSoundID(soundID)
    }
}
