//
//  AHAudioPlayer.swift
//  AHComponents
//
//  Created by ByteDance on 2023/4/24.
//

import Foundation
import AVFoundation

public final class AHAudioPlayer: NSObject {
    public static let shared = AHAudioPlayer()
    
    private var player: AVAudioPlayer?
    
    public var playEndCallBack: ((_ flag: Bool)->())?
    
    fileprivate var timer = Timer()
    
    public var playTimeCallBack: ((_ curTime: TimeInterval?, _ duration: TimeInterval?) -> ())?
}

extension AHAudioPlayer {
    public func configAudio(urlStr: String) {
        if let url = URL(string: urlStr) {
            player = try? AVAudioPlayer(contentsOf: url)
            player?.delegate = self
        }
        #if DEBUG
            let path = AHTools.findSourceBundle().path(forResource: "ring", ofType: "mp3")
            player = try? AVAudioPlayer(contentsOf: URL(string: path ?? "")!)
            player?.delegate = self
        #endif
    }
    
    public func playStatus() -> Bool {
        return player?.isPlaying ?? false
    }
    
    public func play() {
        player?.play()
        timer = Timer(timeInterval: 1/60, repeats: true, block: { [weak self] _ in
            if let callBack = self?.playTimeCallBack {
                callBack(self?.player?.currentTime, self?.player?.duration)
            }
        })
        RunLoop.current.add(timer, forMode: .defaultRunLoopMode)
        timer.fire()
    }
    
    public func stop() {
        player?.stop()
        timer.invalidate()
    }
    
    public func pause() {
        player?.pause()
        timer.invalidate()
    }
}

extension AHAudioPlayer {
    // 播放速度
    public func playSpeed(speed: Float?) {
        player?.enableRate = true
        player?.rate = speed ?? 1
    }
    
    // 播放音量，范围0-1
    public func playVolume(volume: Float?) {
        player?.volume = volume ?? 0.5
    }
    
    // 声道偏移，范围-1(左声道)~1(右声道)
    public func playPan(pan: Float?) {
        player?.pan = pan ?? 0
    }
}

extension AHAudioPlayer: AVAudioPlayerDelegate {
    public func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if let callBack = self.playEndCallBack {
            callBack(flag)
        }
    }
}
