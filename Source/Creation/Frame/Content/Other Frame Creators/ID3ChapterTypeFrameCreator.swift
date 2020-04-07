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
    private let uInt32ToByteArrayAdapter: UInt32ToByteArrayAdapter

    init(frameContentSizeCalculator: FrameContentSizeCalculator,
         frameFlagsCreator: FrameFlagsCreator,
         stringToBytesAdapter: StringToBytesAdapter,
         frameCreatorsChain: ID3FrameCreatorsChain,
         uInt32ToByteArrayAdapter: UInt32ToByteArrayAdapter) {
        self.frameContentSizeCalculator = frameContentSizeCalculator
        self.frameFlagsCreator = frameFlagsCreator
        self.stringToBytesAdapter = stringToBytesAdapter
        self.frameCreatorsChain = frameCreatorsChain
        self.uInt32ToByteArrayAdapter = uInt32ToByteArrayAdapter
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
                uInt32ToByteArrayAdapter.adapt(uInt32: UInt32(startTime)),
                uInt32ToByteArrayAdapter.adapt(uInt32: UInt32(endTime)),
                uInt32ToByteArrayAdapter.adapt(uInt32: UInt32(startingByteOffset)),
                uInt32ToByteArrayAdapter.adapt(uInt32: UInt32(endingByteOffset)),
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

