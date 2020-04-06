//
//  ID3ChapterFrameCreator.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 4/5/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

class ID3ChapterFrameCreator: ID3FrameCreatorsChain {
    private let frameCreator: ChapterFrameCreator
    private var id3FrameConfiguration: ID3FrameConfiguration
    
    init(frameCreator: ChapterFrameCreator,
         id3FrameConfiguration: ID3FrameConfiguration) {
        self.frameCreator = frameCreator
        self.id3FrameConfiguration = id3FrameConfiguration
    }
    
    override func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {
        if let chapterFrame = id3Tag.frames[.Chapter] as? ID3ChapterFrame {
            let newTag = tag +
                frameCreator.createFrame(
                    frameIdentifier: id3FrameConfiguration.identifierFor(
                        frameType: .Chapter,
                        version: id3Tag.properties.version
                    ),
                    version: id3Tag.properties.version,
                    elementID: chapterFrame.elementID,
                    startTime: chapterFrame.startTime,
                    endTime: chapterFrame.endTime,
                    startingByteOffset: chapterFrame.startByteOffset,
                    endingByteOffset: chapterFrame.endByteOffset,
                    embeddedSubframes: chapterFrame.embeddedSubframes
            )
            return super.createFrames(id3Tag: id3Tag, tag: newTag)
        }
        return super.createFrames(id3Tag: id3Tag, tag: tag)
    }
}
