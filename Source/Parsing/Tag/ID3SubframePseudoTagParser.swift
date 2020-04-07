//
//  ID3SubframePseudoTagParser.swift
//
//  Created by Nolaine Crusher on 4/7/2020.
//  2018 Fabrizio Duroni.
//

import Foundation;

class ID3SubframePseudoTagParser {
    private let tagVersionParser: TagVersionParser
    private let tagPresence: TagPresence
    private let tagSizeParser: TagSizeParser
    private var id3TagConfiguration: ID3TagConfiguration
    private let framesParser: ID3FramesParser
    
    init(tagVersionParser: TagVersionParser,
         tagPresence: TagPresence,
         tagSizeParser: TagSizeParser,
         id3TagConfiguration: ID3TagConfiguration,
         frameParser: ID3FramesParser) {
        self.tagVersionParser = tagVersionParser
        self.tagPresence = tagPresence
        self.tagSizeParser = tagSizeParser
        self.framesParser = frameParser
        self.id3TagConfiguration = id3TagConfiguration
    }
    
    func parse(subframeData: Data) throws -> ID3Tag? {
        let version = tagVersionParser.parse(mp3: subframeData)
        if (tagPresence.isTagPresentIn(mp3: subframeData, version: version)) {
            let subframePseudoTag = ID3Tag(version: version, frames: [:])
            parseTagSizeFor(mp3: subframeData as NSData, andSaveInId3Tag: subframePseudoTag)
            try validate(tagSize: subframePseudoTag.properties.size, mp3: subframeData)
            framesParser.parse(mp3: subframeData as NSData, id3Tag: subframePseudoTag)
            return subframePseudoTag
        }
        return nil
    }
    
    private func parseTagSizeFor(mp3: NSData, andSaveInId3Tag id3Tag: ID3Tag) {
        id3Tag.properties.size = tagSizeParser.parse(data: mp3);
    }
    
    func validate(tagSize: UInt32, mp3: Data) throws {
        if mp3.count < (Int(tagSize) + id3TagConfiguration.headerSize()) {
            throw ID3TagEditorError.CorruptedFile;
        }
    }
}
