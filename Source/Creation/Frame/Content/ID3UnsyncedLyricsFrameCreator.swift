//
//  ID3UnsyncedLyricsFrameCreator.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//
import Foundation

class ID3UnsyncedLyricsFrameCreator: ID3FrameCreatorsChain {
    private let frameCreator: CommentTypesFrameCreator
    private var id3FrameConfiguration: ID3FrameConfiguration

    init(frameCreator: CommentTypesFrameCreator, id3FrameConfiguration: ID3FrameConfiguration) {
        self.frameCreator = frameCreator
        self.id3FrameConfiguration = id3FrameConfiguration
    }

    override func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {
        if let lyricsFrame = id3Tag.frames[.UnsyncedLyrics] as? ID3FrameCommentTypes {
            let newTag = tag +
                frameCreator.createFrame(
                    frameIdentifier: id3FrameConfiguration.identifierFor(
                        frameType: .UnsyncedLyrics,
                        version: id3Tag.properties.version
                    ),
                    version: id3Tag.properties.version, language: lyricsFrame.language, description: lyricsFrame.description,
                    content: lyricsFrame.content
            )
            return super.createFrames(id3Tag: id3Tag, tag: newTag)
        }
        return super.createFrames(id3Tag: id3Tag, tag: tag)
    }
}
