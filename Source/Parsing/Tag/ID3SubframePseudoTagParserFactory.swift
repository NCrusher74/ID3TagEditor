//
//  ID3SubframePseudoTagParser.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3SubframePseudoTagParserFactory {
    static func make() -> ID3SubframePseudoTagParser {
        let id3FrameConfiguration = ID3FrameConfiguration()
        let id3TagConfiguration = ID3TagConfiguration()
        let subframePseudoTagParser = ID3SubframePseudoTagParser(
            tagSizeParser: ID3TagSizeParser(),
            id3TagConfiguration: id3TagConfiguration,
            frameParser: ID3FramesParser(
                frameSizeParser: ID3FrameSizeParser(
                    frameContentSizeParser: ID3FrameContentSizeParser(
                        id3FrameConfiguration: id3FrameConfiguration,
                        synchsafeIntegerDecoder: SynchsafeIntegerDecoder()),
                    id3FrameConfiguration: id3FrameConfiguration
                ),
                id3FrameParser: ID3FrameParser(
                    frameContentParsingOperations: ID3FrameContentParsingOperationFactory.make(),
                    id3FrameConfiguration: id3FrameConfiguration
                ),
                id3TagConfiguration: id3TagConfiguration
            )
        )
        return subframePseudoTagParser
    }
}
