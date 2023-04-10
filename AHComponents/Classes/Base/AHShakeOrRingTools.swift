//
//  AHShakeOrRingTools.swift
//  AHComponents
//
//  Created by ByteDance on 2023/4/10.
//

import Foundation

public class AHShakeOrRingTools {
    fileprivate var timer = Timer()
    
    private func configTimer(duration: TimeInterval?) {
        let durationTimer = duration ?? 1
        timer = Timer(timeInterval: durationTimer, repeats: false, block: { _ in
            
        })
        RunLoop.current.add(timer, forMode: .defaultRunLoopMode)
        // 开始计时
        timer.fire()
    }
}
