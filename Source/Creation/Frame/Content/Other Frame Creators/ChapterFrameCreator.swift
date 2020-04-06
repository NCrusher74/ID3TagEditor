//
//  ChapterTypeFrameCreator.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 4/5/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

protocol ChapterFrameCreator {
    func createFrame(
        frameIdentifier: [UInt8],
        version: ID3Version,
        elementID: String,
        startTime: Int,
        endTime: Int,
        startingByteOffset: Int,
        endingByteOffset: Int,
        embeddedSubframes: [FrameName: ID3Frame]) -> [UInt8]
}
