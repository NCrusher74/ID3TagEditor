//
//  ID3FrameFromStringContentCreatorTest.swift
//
//  Created by Nolaine Crusher on 03/31/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3BooleanFrameCreatorTest: XCTestCase {
    func testCreatorFrameFromBooleanContent() {
        let id3FrameFromBooleanContentCreator = ID3FrameFromBooleanContentCreator(
            frameContentSizeCalculator: ID3FrameContentSizeCalculator(
                uInt32ToByteArrayAdapter: UInt32ToByteArrayAdapterUsingUnsafePointer(),
                synchsafeEncoder: SynchsafeIntegerEncoder()
            ),
            frameFlagsCreator: ID3FrameFlagsCreator()
        )

        let frameBytes = id3FrameFromBooleanContentCreator.createFrame(
            frameIdentifier: [0x22],
            version: .version3,
            value: false
        )
        
        XCTAssertEqual(
            frameBytes,
            [
                0x22, // Identifier
                0x00, 0x00, 0x00, 0x04, // Size
                0x00, 0x00, // Flags
                0x00, 0x00, 0x00, 0x00 // “false”
            ]
        )
    }
}
