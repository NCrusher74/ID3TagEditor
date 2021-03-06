//
//  ID3iTunesPodcastUrlFrameCreatorTest.swift
//
//  Created by Nolaine Crusher on 03/30/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3iTunesPodcastUrlFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoiTunesPodcastUrl() {
        let tagBytes: [UInt8] = [1, 1, 1]
        let id3iTunesPodcastUrlFrameCreator = ID3iTunesPodcastUrlFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: [],
                frameTypeToBeChecked: .iTunesPodcastUrl
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        
        let newTagBytes = id3iTunesPodcastUrlFrameCreator.createFrames(id3Tag: ID3Tag(version: .version3, frames: [:]), tag: tagBytes)
        
        XCTAssertEqual(newTagBytes, tagBytes)
    }
    
    func testFrameCreationWhenThereIsAiTunesPodcastUrl() {
        let newFrameBytes: [UInt8] = [1, 1]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [.iTunesPodcastUrl : ID3FrameWithStringContent(content: ":: http://www.exampleurl.com ::")]
        )
        let id3iTunesPodcastUrlFrameCreator = ID3iTunesPodcastUrlFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: newFrameBytes,
                frameTypeToBeChecked: .iTunesPodcastUrl
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        
        let newTagBytes = id3iTunesPodcastUrlFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)
        
        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }
}
