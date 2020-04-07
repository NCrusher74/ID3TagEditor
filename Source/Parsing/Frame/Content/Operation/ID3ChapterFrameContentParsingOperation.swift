//
//  ID3CreditsListFrameContentParsingOperation.swift
//
//  Created by Nolaine Crusher on 4/06/20.
//  2018 Fabrizio Duroni.
//

import Foundation

struct ID3ChapterFrameContentParsingOperation: FrameContentParsingOperation, FrameParser {
    
    let frameName: FrameName
    
    func parse(frame: Data, version: ID3Version, completed: (FrameName, ID3Frame) -> ()) {
        var parsing = frame[...]
        extractHeader(from: &parsing, version: version)
        
        let encoding = extractEncoding(from: &parsing)
        
        let parsed = extractChapterElements(
            from: &parsing,
            encoding: encoding)

        let constructed = ID3ChapterFrame(
            elementID: parsed.elementID,
            startTime: parsed.startTime,
            endTime: parsed.endTime,
            startByteOffset: parsed.startByteOffset,
            endByteOffset: parsed.endByteOffset,
            embeddedSubframes: <#T##[FrameName : ID3Frame]#>
        )
        completed(frameName, constructed)
    }
}
