//
// Created by Thomas Christensen on 24/08/16.
// Copyright (c) 2016 Nordija A/S. All rights reserved.
//

import Foundation

open class MediaPlaylist {
    // Weak reference since MasterPlaylist references with the playlists array
    weak var masterPlaylist: MasterPlaylist?

    open var programId: Int = 0
    public var groupId: String?
    public var audioTrackId: String?
    open var bandwidth: Int = 0
    open var path: String?
    open var version: Int?
    open var targetDuration: Int?
    open var mediaSequence: Int?
    var segments = [MediaSegment]()

    // Raw data
    public var m3u8String: String = ""
    public var m3u8Data: Data? {
        return m3u8String.data(using: String.Encoding.utf8)
    }
    
    // Advanced attributes
    public var type: String?
    public var language: String?
    
    public init() {

    }

    open func addSegment(_ segment: MediaSegment) {
        segments.append(segment)
    }

    open func getSegment(_ index: Int) -> MediaSegment? {
        if index >= segments.count {
            return nil
        }
        return segments[index]
    }

    open func getSegmentCount() -> Int {
        return segments.count
    }

    open func duration() -> Float {
        var dur: Float = 0.0
        for item in segments {
            dur = dur + item.duration!
        }
        return dur
    }

    open func getMaster() -> MasterPlaylist? {
        return self.masterPlaylist
    }
}
