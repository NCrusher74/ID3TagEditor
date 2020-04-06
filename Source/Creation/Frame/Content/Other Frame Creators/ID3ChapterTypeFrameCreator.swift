//
//  ID3ChapterTypeFrameCreator.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 4/5/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

class ID3ChapterTypeFrameCreator: ChapterFrameCreator {
    
    private let frameContentSizeCalculator: FrameContentSizeCalculator
    private let frameFlagsCreator: FrameFlagsCreator
    private let stringToBytesAdapter: StringToBytesAdapter
    private let frameCreatorsChain: ID3FrameCreatorsChain

    init(frameContentSizeCalculator: FrameContentSizeCalculator,
         frameFlagsCreator: FrameFlagsCreator,
         stringToBytesAdapter: StringToBytesAdapter,
         frameCreatorsChain: ID3FrameCreatorsChain) {
        self.frameContentSizeCalculator = frameContentSizeCalculator
        self.frameFlagsCreator = frameFlagsCreator
        self.stringToBytesAdapter = stringToBytesAdapter
        self.frameCreatorsChain = frameCreatorsChain
    }
    
    private func getAsciiCodesOfDigits(_ n: Int)->[UInt8]{
        return String(n).unicodeScalars.map{UInt8($0.value)}
    }

    func createFrame(
        frameIdentifier: [UInt8],
        version: ID3Version,
        elementID: String,
        startTime: Int,
        endTime: Int,
        startingByteOffset: Int,
        endingByteOffset: Int,
        embeddedSubframes: [FrameName: ID3Frame]) -> [UInt8] {
        
        let subframePseudoTag = ID3Tag(
            version: version,
            frames: embeddedSubframes)
        var subframesAsBytes: [UInt8] = []
        let subframesCreator = ID3FramesCreator(id3FrameCreatorsChain: frameCreatorsChain)
        do {
            subframesAsBytes = try subframesCreator.createFramesUsing(
                id3Tag: subframePseudoTag)
        } catch { print("error creating Chapter Frame", error, error.localizedDescription)}
        
        let frameContents = [UInt8](
            [
                stringToBytesAdapter.encoding(for: version),
                stringToBytesAdapter.adapt(
                    string: elementID,
                    for: version,
                    includingEncoding: false,
                    includingTermination: true
                ),
                getAsciiCodesOfDigits(startTime),
                getAsciiCodesOfDigits(endTime),
                getAsciiCodesOfDigits(startingByteOffset),
                getAsciiCodesOfDigits(endingByteOffset),
                subframesAsBytes
                ].joined()
        )
        
        return [UInt8](
            [
                frameIdentifier,
                frameContentSizeCalculator.calculateSizeOf(
                    content: frameContents, version: version),
                frameFlagsCreator.createFor(version: version),
                frameContents
                ].joined()
        )
    }
}

