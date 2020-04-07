//
//  ID3CreditsListFrameContentParsingOperation.swift
//
//  Created by Nolaine Crusher on 4/06/20.
//  2018 Fabrizio Duroni.
//

import Foundation

struct ID3ChapterFrameContentParsingOperation: FrameContentWithSubframesParsingOperation, FrameParser {
    
    let frameName: FrameName
    
    func parse(frame: Data,
               version: ID3Version,
               subframePseudoTagParser: ID3SubframePseudoTagParser,
               completed: (FrameName, ID3Frame) -> ()) {
        var parsing = frame[...]
        extractHeader(from: &parsing, version: version)
        
        let encoding = extractEncoding(from: &parsing)
        
        let parsed = extractChapterElements(
            from: &parsing,
            encoding: encoding,
            subframePseudoTagParser: subframePseudoTagParser)

        let constructed = ID3ChapterFrame(
            elementID: parsed.elementID,
            startTime: parsed.startTime,
            endTime: parsed.endTime,
            startByteOffset: parsed.startByteOffset,
            endByteOffset: parsed.endByteOffset,
            embeddedSubframes: parsed.embeddedSubframes ?? [:]
        )
        completed(frameName, constructed)
    }
}
