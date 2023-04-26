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
    }
    
    public func stop() {
        player?.stop()
    }
    
    public func pause() {
        player?.pause()
    }
}

extension AHAudioPlayer: AVAudioPlayerDelegate {
    public func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if let callBack = self.playEndCallBack {
            callBack(flag)
        }
    }
}
