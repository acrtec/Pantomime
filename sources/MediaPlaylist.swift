//
// Created by Thomas Christensen on 24/08/16.
// Copyright (c) 2016 Nordija A/S. All rights reserved.
//

import Foundation

public class MediaPlaylist {
    var masterPlaylist: MasterPlaylist?

    public var programId: Int = 0
    public var groupId: String?
    public var audioTrackId: String?
    public var bandwidth: Int = 0
    public var path: String?
    public var version: Int?
    public var targetDuration: Int?
    public var mediaSequence: Int?
    var segments = [MediaSegment]()

    // Raw data
    public var m3u8String: String = ""
    public var m3u8Data: NSData? {
        return m3u8String.dataUsingEncoding(NSUTF8StringEncoding)
    }

    // Advanced attributes
    public var type: String?
    public var language: String?
    
    public init() {

    }

    public func addSegment(segment: MediaSegment) {
        segments.append(segment)
    }

    public func getSegment(index: Int) -> MediaSegment? {
        if index >= segments.count {
            return nil
        }
        return segments[index]
    }

    public func getSegmentCount() -> Int {
        return segments.count
    }

    public func duration() -> Float {
        var dur: Float = 0.0
        for item in segments {
            dur = dur + item.duration!
        }
        return dur
    }

    public func getMaster() -> MasterPlaylist? {
        return self.masterPlaylist
    }
}
