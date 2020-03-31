//
//  ID3ITunesCompilationFlagContentParsingOperationFactory.swift
//
//  Created by Nolaine Crusher on 03/31/2020.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3ITunesCompilationFlagFrameContentParsingOperationFactory {
    static func make() -> ID3FrameBooleanContentParsingOperation {
        return ID3FrameBooleanContentParsingOperationFactory.make() { (value: Bool) in
            return (.ITunesCompilation, ID3FrameWithBooleanContent(value: value))
        }
    }
}
