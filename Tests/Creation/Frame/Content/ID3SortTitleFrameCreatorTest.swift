//
//  ID3SortTitleFrameCreatorTest.swift
//
//  Created by Nolaine Crusher on 03/30/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3SortTitleFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoSortTitle() {
        let tagBytes: [UInt8] = [1, 1, 1]
        let id3SortTitleFrameCreator = ID3SortTitleFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: [],
                frameTypeToBeChecked: .SortTitle
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        
        let newTagBytes = id3SortTitleFrameCreator.createFrames(id3Tag: ID3Tag(version: .version3, frames: [:]), tag: tagBytes)
        
        XCTAssertEqual(newTagBytes, tagBytes)
    }
    
    func testFrameCreationWhenThereIsASortTitle() {
        let newFrameBytes: [UInt8] = [1, 1]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [.SortTitle : ID3FrameWithStringContent(content: ":: example title sort::")]
        )
        let id3SortTitleFrameCreator = ID3SortTitleFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: newFrameBytes,
                frameTypeToBeChecked: .SortTitle
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        
        let newTagBytes = id3SortTitleFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)
        
        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }
}
