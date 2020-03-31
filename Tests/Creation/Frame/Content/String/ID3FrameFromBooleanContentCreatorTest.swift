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
                frameContentSizeCalculator: MockFrameContentSizeCalculator(),
                frameFlagsCreator: MockFrameFlagsCreator()
        )


        let frameBytes = id3FrameFromBooleanContentCreator.createFrame(
            frameIdentifier: [0x22],
            version: .version3,
            value: false
        )
        
        XCTAssertEqual(
            frameBytes,
            [
                0x22, // Identifier (See above.)
                0x00, 0x00, 0x00, 0x28, // Size -- where do I get this?
                0x00, 0x00, // Flags
                0x01, // UCS‐2
                0x00, 0x00, 0x00, 0x00 // “false”
            ]
        )
    }
}
