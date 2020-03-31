//
//  ID3PodcastFlagContentParsingOperationFactory.swift
//
//  Created by Nolaine Crusher on 03/31/2020.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3PodcastFlagFrameContentParsingOperationFactory {
    static func make() -> ID3FrameBooleanContentParsingOperation {
        return ID3FrameBooleanContentParsingOperationFactory.make() { (value: Bool) in
            return (.Podcast, ID3FrameWithBooleanContent(value: value))
        }
    }
}
