//
//  ID3MusicianCreditsListFrameCreatorTest.swift
//
//  Created by Nolaine Crusher on 04/03/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3MusicianCreditsListFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoMusicianCreditsList() {
        let tagBytes: [UInt8] = [1, 1, 1]
        
        let id3MusicianCreditsListFrameCreator = ID3MusicianCreditsListFrameCreator(
            frameCreator:
            ID3CreditsListFrameCreator(
                frameContentSizeCalculator: MockFrameContentSizeCalculator(),
                frameFlagsCreator: MockFrameFlagsCreator(),
                stringToBytesAdapter: MockStringToBytesAdapter()
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        
        let newTagBytes = id3MusicianCreditsListFrameCreator.createFrames(id3Tag: ID3Tag(version: .version3, frames: [:]), tag: tagBytes)
        
        XCTAssertEqual(newTagBytes, tagBytes)
    }
        
    func testFrameCreationWhenThereIsAnMusicianCreditssList() {
        let newFrameBytes: [UInt8] = [
            0x54, 0x4d, 0x43, 0x4c, // TMCL
            0x11, // Size (see MockFrameContentSizeCalculator)
            0x00, // Flags (see MockFrameFlagsCreator
            0x00, // Latin‐1
            0x4d, 0x75, 0x73, 0x69, 0x63, 0x69, 0x61, 0x6e, 0x00, // Musician
            0x4d, 0x75, 0x73, 0x69, 0x63, 0x69, 0x61, 0x6e, 0x20, 0x4e, 0x61, 0x6d, 0x65, 0x00, // Musician Name
        ]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID3Tag(
            version: .version4,
            frames: [.MusicianCredits: ID3FrameCreditsList(entries: [("Musician", "Musician Name")])]
        )
        let configuration = ID3FrameConfiguration()
        let id3MusicianCreditsListFrameCreator = ID3MusicianCreditsListFrameCreator(
            frameCreator:
            ID3CreditsListFrameCreator(
                frameContentSizeCalculator: MockFrameContentSizeCalculator(),
                frameFlagsCreator: MockFrameFlagsCreator(),
                stringToBytesAdapter: ID3ISO88591StringToByteAdapter(
                    paddingAdder: MockPaddingAdder(),
                    frameConfiguration: configuration
                )
            ),
            id3FrameConfiguration: configuration
        )
        
        let newTagBytes = id3MusicianCreditsListFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)
        
        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }
    
    func testFrameCreationWhenThereAreMultipleRoles() {
        let newFrameBytes: [UInt8] = [
            0x54, 0x4d, 0x43, 0x4c, // TMCL
            0x11, // Size (see MockFrameContentSizeCalculator)
            0x00, // Flags (see MockFrameFlagsCreator
            0x00, // Latin‐1
            0x4d, 0x75, 0x73, 0x69, 0x63, 0x69, 0x61, 0x6e, 0x00, // Musician
            0x4d, 0x75, 0x73, 0x69, 0x63, 0x69, 0x61, 0x6e, 0x20, 0x4e, 0x61, 0x6d, 0x65, 0x00, // Musician Name
            0x53, 0x69, 0x6e, 0x67, 0x65, 0x72, 0x00, // Singer
            0x53, 0x69, 0x6e, 0x67, 0x65, 0x72, 0x20, 0x4e, 0x61, 0x6d, 0x65, 0x00, // Singer Name
        ]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID3Tag(
            version: .version4,
            frames: [
                .MusicianCredits: ID3FrameCreditsList(
                    entries: [(role: "Musician", person: "Musician Name"), (role: "Singer", person: "Singer Name")])
            ]
        )
        let configuration = ID3FrameConfiguration()
        let id3MusicianCreditsListFrameCreator = ID3MusicianCreditsListFrameCreator(
            frameCreator:
            ID3CreditsListFrameCreator(
                frameContentSizeCalculator: MockFrameContentSizeCalculator(),
                frameFlagsCreator: MockFrameFlagsCreator(),
                stringToBytesAdapter: ID3ISO88591StringToByteAdapter(
                    paddingAdder: MockPaddingAdder(),
                    frameConfiguration: configuration
                )
            ),
            id3FrameConfiguration: configuration
        )
        
        let newTagBytes = id3MusicianCreditsListFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)
        
        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }
}
