//
//  FrameContentWithSubframesParsingOperation.swift
//
//  Created by Fabrizio Duroni on 20/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

protocol FrameContentWithSubframesParsingOperation {
    func parse(frame: Data, version: ID3Version, subframePseudoTagParser: ID3SubframePseudoTagParser, completed: (FrameName, ID3Frame) -> ())
}
