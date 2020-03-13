//
//  ID3UserDefinedTextInformationFrameCreatorTest.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3UserDefinedTextInformationFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoUserDefinedText() {
        let tagBytes: [UInt8] = [1, 1, 1]
        #warning("I'm getting an error here: Extra argument 'frameCreator' in call")
        #warning("I'm having a hard time figuring out why.")

        let id3UserTextFrameCreator = ID3UserDefinedTextFrameCreator(
            frameCreator: MockUserTextFrameContentCreator(
                fakeNewFrameAsByte: [],
                frameTypeToBeChecked: .UserDefinedTextInformation
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        
        let newTagBytes = id3UserTextFrameCreator.createFrames(id3Tag: ID3Tag(version: .version3, frames: [:]), tag: tagBytes)
        
        XCTAssertEqual(newTagBytes, tagBytes)
    }
    
    func testFrameCreationWhenThereIsUserDefinedText() {
        let newFrameBytes: [UInt8] = [1, 1]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [.UserDefinedTextInformation: ID3FrameUserDefinedText(description: "test", content: "::some sample text::")]
        )
        let id3UserTextFrameCreator = ID3UserDefinedTextInformationFrameCreator(
            frameCreator: MockUserTextFrameContentCreator(
                fakeNewFrameAsByte: newFrameBytes,
                frameTypeToBeChecked: .UserDefinedTextInformation
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        
        let newTagBytes = id3UserTextFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)
        
        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }
}
