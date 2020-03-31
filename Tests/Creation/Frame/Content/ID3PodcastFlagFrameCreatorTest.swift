//
//  ID3PodcastFlagFrameCreatorTest.swift
//
//  Created by Nolaine Crusher on 03/31/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3PodcastFlagFrameCreatorTest: XCTestCase {
    func testFrameCreationWhenPodcastFlagIsOne() {
        let newFrameBytes: [UInt8] = [0, 0, 0, 1]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [.Podcast : ID3FrameWithBooleanContent(value: true)]
        )
        let id3CompilationFlagFrameCreator = ID3PodcastFlagFrameCreator(
            frameCreator: MockBooleanFrameContentCreator(
                fakeNewFrameAsByte: newFrameBytes,
                frameTypeToBeChecked: .Podcast
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        
        let newTagBytes = id3CompilationFlagFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)
        
        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }

    func testFrameCreationWhenPodcastFlagIsZero() {
        let newFrameBytes: [UInt8] = [0, 0, 0, 0]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [.Podcast : ID3FrameWithBooleanContent(value: false)]
        )
        let id3CompilationFlagFrameCreator = ID3PodcastFlagFrameCreator(
            frameCreator: MockBooleanFrameContentCreator(
                fakeNewFrameAsByte: newFrameBytes,
                frameTypeToBeChecked: .Podcast
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        
        let newTagBytes = id3CompilationFlagFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)
        
        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }
}
