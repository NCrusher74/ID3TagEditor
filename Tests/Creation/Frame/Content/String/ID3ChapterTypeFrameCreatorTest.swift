//
//  ID3ChapterTypeFrameCreatorTest.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 4/6/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import XCTest
@testable import ID3TagEditor

class ID3ChapterTypeFrameCreatorTest: XCTestCase {
    func testCreatorFrameChapterType() {
        let id3ChapterTypeFrameCreator = ID3ChapterTypeFrameCreator(
            frameContentSizeCalculator: ID3FrameContentSizeCalculator(
                uInt32ToByteArrayAdapter: UInt32ToByteArrayAdapterUsingUnsafePointer(),
                synchsafeEncoder: SynchsafeIntegerEncoder()
            ),
            frameFlagsCreator: ID3FrameFlagsCreator(),
            stringToBytesAdapter: ID3ISO88591StringToByteAdapter(
                paddingAdder: PaddingAdderToEndOfContentUsingNullChar(),
                frameConfiguration: ID3FrameConfiguration()
            ), frameCreatorsChain: ID3FrameCreatorsChain()
        )
        
        let frameBytes = id3ChapterTypeFrameCreator.createFrame(
            frameIdentifier: [0x22],
            version: .version3,
            elementID: "ch01",
            startTime: 5000,
            endTime: 10000,
            startingByteOffset: 0,
            endingByteOffset: 0,
            embeddedSubframes: [.Title : ID3FrameWithStringContent(content:  "Chapter 01")]
        )
        
//        let id3FrameFromStringContentCreator = ID3FrameFromStringContentCreator(
//            frameContentSizeCalculator: ID3FrameContentSizeCalculator(
//                uInt32ToByteArrayAdapter: UInt32ToByteArrayAdapterUsingUnsafePointer(),
//                synchsafeEncoder: SynchsafeIntegerEncoder()
//            ),
//            frameFlagsCreator: ID3FrameFlagsCreator(),
//            stringToBytesAdapter: ID3UTF16StringToByteAdapter(
//                paddingAdder: PaddingAdderToEndOfContentUsingNullChar(),
//                frameConfiguration: ID3FrameConfiguration()
//            )
//        )
//        let subframeBytes = id3FrameFromStringContentCreator.createFrame(
//            frameIdentifier: [0x22],
//            version: .version3,
//            content: "Chapter 01")
        // print(subframeBytes)

        
        XCTAssertEqual(
            frameBytes,
            [
                0x22, // Identifier (See above.)
                0x00, 0x00, 0x00, 0x18, // Size
                0x00, 0x00, // Flags
                0x01, // UCS‐2
                0x35, 0x30, 0x30, 0x30, // 5000
                0x31, 0x30, 0x30, 0x30, 0x30, // 10000
                0x30, // 0
                0x30, // 0
                0x22, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0xFF, 0xFE, 0x43, 0x00, 0x68, 0x00, 0x70, 0x00, 0x74, 0x00, 0x65, 0x00, 0x72, 0x00, 0x20, 0x00, 0x30, 0x00, 0x31, 0x00, 0x00, 0x00 // embedded subframe
           ]
        )
    }
}
