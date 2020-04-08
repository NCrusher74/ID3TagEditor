//
//  ID3TagEditortestAcceptanceCHAPandCTOC.swift
//
//  Created by Nolaine Crusher on 4/7/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3TagEditortestAcceptanceCHAPandCTOC: XCTestCase {
    let id3TagEditor = ID3TagEditor()
    
    //MARK: read
        
    func testReadChapterFramesV3() throws {
        let path = PathLoader().pathFor(name: "example-with-chapters-and-ctoc", fileType: "mp3")
        // See testReadNewFramesV2 for an explanation of the duplication.
        _ = try? id3TagEditor.read(from: path)
        let id3Tag = try id3TagEditor.read(from: path)
        print(id3Tag as Any)
        
        XCTAssertEqual(id3Tag?.properties.version, .version3)
        XCTAssertEqual(id3Tag?.frames[.Chapter]?.id3Identifier, "CHAP")
    }
    
    func testReadChapterFramesV4() throws {
        let path = PathLoader().pathFor(name: "example-newframes-v4-written", fileType: "mp3")
        // See testReadNewFramesV2 for an explanation of the duplication.
        _ = try? id3TagEditor.read(from: path)
        let id3Tag = try id3TagEditor.read(from: path)
        
        XCTAssertEqual(id3Tag?.properties.version, .version4)
        XCTAssertEqual((id3Tag?.frames[.Arranger] as? ID3FrameWithStringContent)?.id3Identifier, "TPE4")
        XCTAssertEqual((id3Tag?.frames[.Arranger] as? ID3FrameWithStringContent)?.content, "Arranger")
    }
    
    //MARK: write

    func testWriteChapterFramesV3() {
        let pathMp3ToCompare = PathLoader().pathFor(name: "example-newframes-v3-written", fileType: "mp3")
        let generationURL = PathLoader.testOutputDirectory
            .appendingPathComponent("example-newframes-v3-generated.mp3")
        try? FileManager.default.removeItem(at: generationURL)
        let pathMp3Generated = generationURL.path
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [
                .Arranger : ID3FrameWithStringContent(content: "Arranger"),
            ]
        )
        
        XCTAssertNoThrow(try id3TagEditor.write(
            tag: id3Tag,
            to: PathLoader().pathFor(name: "example-newframes", fileType: "mp3"),
            andSaveTo: pathMp3Generated
            ))
        XCTAssertEqual(
            try! Data(contentsOf: URL(fileURLWithPath: pathMp3Generated)),
            try! Data(contentsOf: URL(fileURLWithPath: pathMp3ToCompare))
        )
    }
    
    func testWriteNewFramesV4() {
        let pathMp3ToCompare = PathLoader().pathFor(name: "example-newframes-v4-written", fileType: "mp3")
        let generationURL = PathLoader.testOutputDirectory
            .appendingPathComponent("example-newframes-v4-generated.mp3")
        try? FileManager.default.removeItem(at: generationURL)
        let pathMp3Generated = generationURL.path
        let id3Tag = ID3Tag(
            version: .version4,
            frames: [
                .Arranger : ID3FrameWithStringContent(content: "Arranger"),
            ]
        )
        
        XCTAssertNoThrow(try id3TagEditor.write(
            tag: id3Tag,
            to: PathLoader().pathFor(name: "example-newframes", fileType: "mp3"),
            andSaveTo: pathMp3Generated
            ))
        
        XCTAssertEqual(
            try! Data(contentsOf: URL(fileURLWithPath: pathMp3Generated)),
            try! Data(contentsOf: URL(fileURLWithPath: pathMp3ToCompare))
        )
    }
}
