//
//  ID3SortAlbumFrameCreator.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/30/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

class ID3SortAlbumFrameCreator: ID3StringFrameCreator {
    override func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {
        if let sortAlbumFrame = id3Tag.frames[.SortAlbum] as? ID3FrameWithStringContent {
            return createFrameUsing(frameType: .SortAlbum, content: sortAlbumFrame.content, id3Tag: id3Tag, andAddItTo: tag)
        }
        return super.createFrames(id3Tag: id3Tag, tag: tag)
    }
}
