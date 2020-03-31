//
//  ID3TagEditorTestAcceptanceNewFrames.swift
//
//  Created by Fabrizio Duroni on 23/02/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3TagEditorTestAcceptanceNewFrames: XCTestCase {
    let id3TagEditor = ID3TagEditor()
    
    //MARK: read
    
    func testReadNewFramesV2() throws {
        let path = PathLoader().pathFor(name: "example-newframes-v2-written", fileType: "mp3")
        // Attempting twice allows it to succeed even if the operating system rejects the first attempt. This can happen if the previous test run crashed in the middle without telling the system it was done with the file.
        _ = try? id3TagEditor.read(from: path)
        let id3Tag = try id3TagEditor.read(from: path)
        
        XCTAssertEqual(id3Tag?.properties.version, .version2)
        XCTAssertEqual(id3Tag?.frames[.Arranger]?.id3Identifier, "TP4")
        XCTAssertEqual((id3Tag?.frames[.Arranger] as? ID3FrameWithStringContent)?.content, "Arranger")
        XCTAssertEqual(id3Tag?.frames[.ArtistUrl]?.id3Identifier, "WAR")
        XCTAssertEqual((id3Tag?.frames[.ArtistUrl] as? ID3FrameWithStringContent)?.content, "http://V2ArtistUrl.com")
        XCTAssertEqual(id3Tag?.frames[.AudioFileUrl]?.id3Identifier, "WAF")
        XCTAssertEqual((id3Tag?.frames[.AudioFileUrl] as? ID3FrameWithStringContent)?.content, "http://V2AudioFileUrl.com")
        XCTAssertEqual(id3Tag?.frames[.AudioSourceUrl]?.id3Identifier, "WAS")
        XCTAssertEqual((id3Tag?.frames[.AudioSourceUrl] as? ID3FrameWithStringContent)?.content, "http://V2AudioSourceUrl.com")
        XCTAssertEqual(id3Tag?.frames[.Composer]?.id3Identifier, "TCM")
        XCTAssertEqual((id3Tag?.frames[.Composer] as? ID3FrameWithStringContent)?.content, "Composer")
        XCTAssertEqual(id3Tag?.frames[.BPM]?.id3Identifier, "TBP")
        XCTAssertEqual((id3Tag?.frames[.BPM] as? ID3FrameWithStringContent)?.content, "99")
        XCTAssertEqual(id3Tag?.frames[.Conductor]?.id3Identifier, "TP3")
        XCTAssertEqual((id3Tag?.frames[.Conductor] as? ID3FrameWithStringContent)?.content, "Conductor")
        XCTAssertEqual(id3Tag?.frames[.ContentGroup]?.id3Identifier, "TT1")
        XCTAssertEqual((id3Tag?.frames[.ContentGroup] as? ID3FrameWithStringContent)?.content, "Content Group")
        XCTAssertEqual(id3Tag?.frames[.Copyright]?.id3Identifier, "TCR")
        XCTAssertEqual((id3Tag?.frames[.Copyright] as? ID3FrameWithStringContent)?.content, "2020 Copyright")
        XCTAssertEqual(id3Tag?.frames[.CopyrightUrl]?.id3Identifier, "WCP")
        XCTAssertEqual((id3Tag?.frames[.CopyrightUrl] as? ID3FrameWithStringContent)?.content, "http://V2CopyrightUrl.com")
        XCTAssertEqual(id3Tag?.frames[.EncodedBy]?.id3Identifier, "TEN")
        XCTAssertEqual((id3Tag?.frames[.EncodedBy] as? ID3FrameWithStringContent)?.content, "EncodedBy")
        XCTAssertEqual(id3Tag?.frames[.EncoderSettings]?.id3Identifier, "TSS")
        XCTAssertEqual((id3Tag?.frames[.EncoderSettings] as? ID3FrameWithStringContent)?.content, "EncoderSettings")
        XCTAssertEqual(id3Tag?.frames[.FileType]?.id3Identifier, "TFT")
        XCTAssertEqual((id3Tag?.frames[.FileType] as? ID3FrameWithStringContent)?.content, "File Type")
        XCTAssertEqual(id3Tag?.frames[.InitialKey]?.id3Identifier, "TKE")
        XCTAssertEqual((id3Tag?.frames[.InitialKey] as? ID3FrameWithStringContent)?.content, "b#")
        XCTAssertEqual(id3Tag?.frames[.ISRC]?.id3Identifier, "TRC")
        XCTAssertEqual((id3Tag?.frames[.ISRC] as? ID3FrameWithStringContent)?.content, "012345678901")
        XCTAssertEqual(id3Tag?.frames[.Length]?.id3Identifier, "TLE")
        XCTAssertEqual((id3Tag?.frames[.Length] as? ID3FrameWithStringContent)?.content, "9744")
        XCTAssertEqual(id3Tag?.frames[.Lyricist]?.id3Identifier, "TXT")
        XCTAssertEqual((id3Tag?.frames[.Lyricist] as? ID3FrameWithStringContent)?.content, "Lyricist")
        XCTAssertEqual(id3Tag?.frames[.MediaType]?.id3Identifier, "TMT")
        XCTAssertEqual((id3Tag?.frames[.MediaType] as? ID3FrameWithStringContent)?.content, "Media Type")
        XCTAssertEqual(id3Tag?.frames[.OriginalAlbum]?.id3Identifier, "TOT")
        XCTAssertEqual((id3Tag?.frames[.OriginalAlbum] as? ID3FrameWithStringContent)?.content, "Original Album")
        XCTAssertEqual(id3Tag?.frames[.OriginalArtist]?.id3Identifier, "TOA")
        XCTAssertEqual((id3Tag?.frames[.OriginalArtist] as? ID3FrameWithStringContent)?.content, "Original Artist")
        XCTAssertEqual(id3Tag?.frames[.OriginalFilename]?.id3Identifier, "TOF")
        XCTAssertEqual((id3Tag?.frames[.OriginalFilename] as? ID3FrameWithStringContent)?.content, "Original Filename")
        XCTAssertEqual(id3Tag?.frames[.OriginalLyricist]?.id3Identifier, "TOL")
        XCTAssertEqual((id3Tag?.frames[.OriginalLyricist] as? ID3FrameWithStringContent)?.content, "Original Lyricist")
        XCTAssertEqual(id3Tag?.frames[.PlaylistDelay]?.id3Identifier, "TDY")
        XCTAssertEqual((id3Tag?.frames[.PlaylistDelay] as? ID3FrameWithStringContent)?.content, "Playlist Delay")
        XCTAssertEqual(id3Tag?.frames[.Publisher]?.id3Identifier, "TPB")
        XCTAssertEqual((id3Tag?.frames[.Publisher] as? ID3FrameWithStringContent)?.content, "Publisher")
        XCTAssertEqual(id3Tag?.frames[.PublisherUrl]?.id3Identifier, "WPB")
        XCTAssertEqual((id3Tag?.frames[.PublisherUrl] as? ID3FrameWithStringContent)?.content, "http://V2PublisherUrl.com")
        XCTAssertEqual(id3Tag?.frames[.Subtitle]?.id3Identifier, "TT3")
        XCTAssertEqual((id3Tag?.frames[.Subtitle] as? ID3FrameWithStringContent)?.content, "Subtitle")
        XCTAssertEqual(id3Tag?.frames[.UnsyncedLyrics]?.id3Identifier, "ULT")
        XCTAssertEqual((id3Tag?.frames[.UnsyncedLyrics] as? ID3FrameCommentTypes)?.content, "UnsyncedLyrics")
        XCTAssertEqual((id3Tag?.frames[.UnsyncedLyrics] as? ID3FrameCommentTypes)?.language, .und)
        XCTAssertEqual((id3Tag?.frames[.UnsyncedLyrics] as? ID3FrameCommentTypes)?.description, "lyricsTest")
        XCTAssertEqual(id3Tag?.frames[.Comment]?.id3Identifier, "COM")
        XCTAssertEqual((id3Tag?.frames[.Comment] as? ID3FrameCommentTypes)?.content, "Comment")
        XCTAssertEqual((id3Tag?.frames[.Comment] as? ID3FrameCommentTypes)?.language, .und)
        XCTAssertEqual((id3Tag?.frames[.Comment] as? ID3FrameCommentTypes)?.description, "commentTest")
        XCTAssertEqual(id3Tag?.frames[.Language]?.id3Identifier, "TLA")
        XCTAssertEqual((id3Tag?.frames[.Language] as? ID3FrameLanguage)?.language, .und)
        XCTAssertEqual(id3Tag?.frames[.UserDefinedTextInformation]?.id3Identifier, "TXX")
        XCTAssertEqual((id3Tag?.frames[.UserDefinedTextInformation] as? ID3FrameUserDefinedText)?.description, "description")
        XCTAssertEqual((id3Tag?.frames[.UserDefinedTextInformation] as? ID3FrameUserDefinedText)?.content, "UserDefinedTextInformation")
        XCTAssertEqual(id3Tag?.frames[.UserDefinedTextInformation]?.id3Identifier, "WXX")
        XCTAssertEqual((id3Tag?.frames[.UserDefinedUrl] as? ID3FrameUserDefinedText)?.description, "UserDefinedUrl")
        XCTAssertEqual((id3Tag?.frames[.UserDefinedUrl] as? ID3FrameUserDefinedText)?.content, "http://V2UserDefinedUrl.com")
        XCTAssertEqual(id3Tag?.frames[.DiscPosition]?.id3Identifier, "TPA")
        XCTAssertEqual((id3Tag?.frames[.DiscPosition] as? ID3FramePartOfTotal)?.part, 3)
        XCTAssertEqual((id3Tag?.frames[.DiscPosition] as? ID3FramePartOfTotal)?.total, 4)
    }
    
    func testReadNewFramesV3() throws {
        let path = PathLoader().pathFor(name: "example-newframes-v3-written", fileType: "mp3")
        // See testReadNewFramesV2 for an explanation of the duplication.
        _ = try? id3TagEditor.read(from: path)
        let id3Tag = try id3TagEditor.read(from: path)
        
        XCTAssertEqual(id3Tag?.properties.version, .version3)
        XCTAssertEqual(id3Tag?.frames[.Arranger]?.id3Identifier, "TPE4")
        XCTAssertEqual((id3Tag?.frames[.Arranger] as? ID3FrameWithStringContent)?.content, "Arranger")
        XCTAssertEqual(id3Tag?.frames[.ArtistUrl]?.id3Identifier, "WOAR")
        XCTAssertEqual((id3Tag?.frames[.ArtistUrl] as? ID3FrameWithStringContent)?.content, "http://ArtistUrl.com")
        XCTAssertEqual(id3Tag?.frames[.AudioFileUrl]?.id3Identifier, "WOAF")
        XCTAssertEqual((id3Tag?.frames[.AudioFileUrl] as? ID3FrameWithStringContent)?.content, "http://AudioFileUrl.com")
        XCTAssertEqual(id3Tag?.frames[.AudioSourceUrl]?.id3Identifier, "WOAS")
        XCTAssertEqual((id3Tag?.frames[.AudioSourceUrl] as? ID3FrameWithStringContent)?.content, "http://AudioSourceUrl.com")
        XCTAssertEqual(id3Tag?.frames[.BPM]?.id3Identifier, "TBPM")
        XCTAssertEqual((id3Tag?.frames[.BPM] as? ID3FrameWithStringContent)?.content, "99")
        XCTAssertEqual(id3Tag?.frames[.Composer]?.id3Identifier, "TCOM")
        XCTAssertEqual((id3Tag?.frames[.Composer] as? ID3FrameWithStringContent)?.content, "Composer")
        XCTAssertEqual(id3Tag?.frames[.Conductor]?.id3Identifier, "TPE3")
        XCTAssertEqual((id3Tag?.frames[.Conductor] as? ID3FrameWithStringContent)?.content, "Conductor")
        XCTAssertEqual(id3Tag?.frames[.Copyright]?.id3Identifier, "TCOP")
        XCTAssertEqual((id3Tag?.frames[.Copyright] as? ID3FrameWithStringContent)?.content, "2020 Copyright")
        XCTAssertEqual(id3Tag?.frames[.CopyrightUrl]?.id3Identifier, "WCOP")
        XCTAssertEqual((id3Tag?.frames[.CopyrightUrl] as? ID3FrameWithStringContent)?.content, "http://CopyrightUrl.com")
        XCTAssertEqual(id3Tag?.frames[.ContentGroup]?.id3Identifier, "TIT1")
        XCTAssertEqual((id3Tag?.frames[.ContentGroup] as? ID3FrameWithStringContent)?.content, "Content Group")
        XCTAssertEqual(id3Tag?.frames[.DiscPosition]?.id3Identifier, "TPOS")
        XCTAssertEqual((id3Tag?.frames[.DiscPosition] as? ID3FramePartOfTotal)?.part, 3)
        XCTAssertEqual((id3Tag?.frames[.DiscPosition] as? ID3FramePartOfTotal)?.total, 4)
        XCTAssertEqual(id3Tag?.frames[.EncodedBy]?.id3Identifier, "TENC")
        XCTAssertEqual((id3Tag?.frames[.EncodedBy] as? ID3FrameWithStringContent)?.content, "EncodedBy")
        XCTAssertEqual(id3Tag?.frames[.EncoderSettings]?.id3Identifier, "TSSE")
        XCTAssertEqual((id3Tag?.frames[.EncoderSettings] as? ID3FrameWithStringContent)?.content, "EncoderSettings")
        XCTAssertEqual(id3Tag?.frames[.InitialKey]?.id3Identifier, "TKEY")
        XCTAssertEqual((id3Tag?.frames[.InitialKey] as? ID3FrameWithStringContent)?.content, "b#")
        XCTAssertEqual(id3Tag?.frames[.ISRC]?.id3Identifier, "TSRC")
        XCTAssertEqual((id3Tag?.frames[.ISRC] as? ID3FrameWithStringContent)?.content, "012345678901")
        XCTAssertEqual(id3Tag?.frames[.ITunesGrouping]?.id3Identifier, "GRP1")
        XCTAssertEqual((id3Tag?.frames[.ITunesGrouping] as? ID3FrameWithStringContent)?.content, "Grouping")
        XCTAssertEqual(id3Tag?.frames[.Length]?.id3Identifier, "TLEN")
        XCTAssertEqual((id3Tag?.frames[.Length] as? ID3FrameWithStringContent)?.content, "9767")
        XCTAssertEqual(id3Tag?.frames[.Lyricist]?.id3Identifier, "TEXT")
        XCTAssertEqual((id3Tag?.frames[.Lyricist] as? ID3FrameWithStringContent)?.content, "Lyricist")
        XCTAssertEqual(id3Tag?.frames[.MediaType]?.id3Identifier, "TMED")
        XCTAssertEqual((id3Tag?.frames[.MediaType] as? ID3FrameWithStringContent)?.content, "Media Type")
        XCTAssertEqual(id3Tag?.frames[.FileType]?.id3Identifier, "TFLT")
        XCTAssertEqual((id3Tag?.frames[.FileType] as? ID3FrameWithStringContent)?.content, "File Type")
        XCTAssertEqual(id3Tag?.frames[.FileOwner]?.id3Identifier, "TOWN")
        XCTAssertEqual((id3Tag?.frames[.FileOwner] as? ID3FrameWithStringContent)?.content, "File Owner")
//        XCTAssertEqual(id3Tag?.frames[.ITunesMovementName]?.id3Identifier, "MVNM")
//        XCTAssertEqual((id3Tag?.frames[.ITunesMovementName] as? ID3FrameWithStringContent)?.content, "Movement Name")
//        XCTAssertEqual(id3Tag?.frames[.ITunesMovementIndex]?.id3Identifier, "MVIN")
        // Commented out because the compliant app I used to write the test file does not have this value
        //        XCTAssertEqual((id3Tag?.frames[.ITunesMovementIndex] as? ID3FrameWithIntegerContent)?.value, 6)
        //        XCTAssertEqual((id3Tag?.frames[.ITunesMovementCount] as? ID3FrameWithIntegerContent)?.value, 13)
        XCTAssertEqual(id3Tag?.frames[.OriginalAlbum]?.id3Identifier, "TOAL")
        XCTAssertEqual((id3Tag?.frames[.OriginalAlbum] as? ID3FrameWithStringContent)?.content, "Original Album")
        XCTAssertEqual(id3Tag?.frames[.OriginalArtist]?.id3Identifier, "TOPE")
        XCTAssertEqual((id3Tag?.frames[.OriginalArtist] as? ID3FrameWithStringContent)?.content, "Original Artist")
        XCTAssertEqual(id3Tag?.frames[.OriginalFilename]?.id3Identifier, "TOFN")
        XCTAssertEqual((id3Tag?.frames[.OriginalFilename] as? ID3FrameWithStringContent)?.content, "Original Filename")
        XCTAssertEqual(id3Tag?.frames[.OriginalLyricist]?.id3Identifier, "TOLY")
        XCTAssertEqual((id3Tag?.frames[.OriginalLyricist] as? ID3FrameWithStringContent)?.content, "Original Lyricist")
        XCTAssertEqual(id3Tag?.frames[.PlaylistDelay]?.id3Identifier, "TDLY")
        XCTAssertEqual((id3Tag?.frames[.PlaylistDelay] as? ID3FrameWithStringContent)?.content, "20")
//        XCTAssertEqual(id3Tag?.frames[.PodcastCategory]?.id3Identifier, "TCAT")
//        XCTAssertEqual((id3Tag?.frames[.PodcastCategory] as? ID3FrameWithStringContent)?.content, "PodcastCategory V3")
//        XCTAssertEqual(id3Tag?.frames[.PodcastDescription]?.id3Identifier, "TDES")
//        XCTAssertEqual((id3Tag?.frames[.PodcastDescription] as? ID3FrameWithStringContent)?.content, "PodcastDescription V3")
//        XCTAssertEqual(id3Tag?.frames[.PodcastID]?.id3Identifier, "TGID")
//        XCTAssertEqual((id3Tag?.frames[.PodcastID] as? ID3FrameWithStringContent)?.content, "PodcastID V3")
//        XCTAssertEqual(id3Tag?.frames[.PodcastKeywords]?.id3Identifier, "TKWD")
//        XCTAssertEqual((id3Tag?.frames[.PodcastKeywords] as? ID3FrameWithStringContent)?.content, "PodcastKeywords V3")
        XCTAssertEqual(id3Tag?.frames[.PodcastUrl]?.id3Identifier, "WFED")
        XCTAssertEqual((id3Tag?.frames[.PodcastUrl] as? ID3FrameWithStringContent)?.content, "http://PodcastUrl.com")
        XCTAssertEqual(id3Tag?.frames[.Publisher]?.id3Identifier, "TPUB")
        XCTAssertEqual((id3Tag?.frames[.Publisher] as? ID3FrameWithStringContent)?.content, "Publisher")
        XCTAssertEqual(id3Tag?.frames[.PublisherUrl]?.id3Identifier, "WPUB")
        XCTAssertEqual((id3Tag?.frames[.PublisherUrl] as? ID3FrameWithStringContent)?.content, "http://PublisherUrl.com")
        XCTAssertEqual(id3Tag?.frames[.RadioStation]?.id3Identifier, "TRSN")
        XCTAssertEqual((id3Tag?.frames[.RadioStation] as? ID3FrameWithStringContent)?.content, "Radio Station")
        XCTAssertEqual(id3Tag?.frames[.RadioStationOwner]?.id3Identifier, "TRSO")
        XCTAssertEqual((id3Tag?.frames[.RadioStationOwner] as? ID3FrameWithStringContent)?.content, "Radio Station Owner")
        XCTAssertEqual(id3Tag?.frames[.RadioStationUrl]?.id3Identifier, "WORS")
        XCTAssertEqual((id3Tag?.frames[.RadioStationUrl] as? ID3FrameWithStringContent)?.content, "http://RadioStationUrl.com")
        XCTAssertEqual(id3Tag?.frames[.SortAlbum]?.id3Identifier, "TSOA")
        XCTAssertEqual((id3Tag?.frames[.SortAlbum] as? ID3FrameWithStringContent)?.content, "Sort Album")
        XCTAssertEqual(id3Tag?.frames[.SortAlbumArtist]?.id3Identifier, "TSO2")
        XCTAssertEqual((id3Tag?.frames[.SortAlbumArtist] as? ID3FrameWithStringContent)?.content, "Sort Album Artist")
        XCTAssertEqual(id3Tag?.frames[.SortArtist]?.id3Identifier, "TSOP")
        XCTAssertEqual((id3Tag?.frames[.SortArtist] as? ID3FrameWithStringContent)?.content, "Sort Artist")
        XCTAssertEqual(id3Tag?.frames[.SortComposer]?.id3Identifier, "TSOC")
        XCTAssertEqual((id3Tag?.frames[.SortComposer] as? ID3FrameWithStringContent)?.content, "Sort Composer")
        XCTAssertEqual(id3Tag?.frames[.SortTitle]?.id3Identifier, "TSOT")
        XCTAssertEqual((id3Tag?.frames[.SortTitle] as? ID3FrameWithStringContent)?.content, "Sort Title")
        XCTAssertEqual(id3Tag?.frames[.Subtitle]?.id3Identifier, "TIT3")
        XCTAssertEqual((id3Tag?.frames[.Subtitle] as? ID3FrameWithStringContent)?.content, "Subtitle")
        XCTAssertEqual(id3Tag?.frames[.UnsyncedLyrics]?.id3Identifier, "USLT")
        XCTAssertEqual((id3Tag?.frames[.UnsyncedLyrics] as? ID3FrameCommentTypes)?.content, "Lyrics")
        XCTAssertEqual((id3Tag?.frames[.UnsyncedLyrics] as? ID3FrameCommentTypes)?.language, .eng)
        XCTAssertEqual((id3Tag?.frames[.UnsyncedLyrics] as? ID3FrameCommentTypes)?.description, "LyricsTest")
        XCTAssertEqual(id3Tag?.frames[.Comment]?.id3Identifier, "COMM")
        XCTAssertEqual((id3Tag?.frames[.Comment] as? ID3FrameCommentTypes)?.language, .eng)
        XCTAssertEqual((id3Tag?.frames[.Comment] as? ID3FrameCommentTypes)?.description, "Comment Description")
        XCTAssertEqual((id3Tag?.frames[.Comment] as? ID3FrameCommentTypes)?.content, "Comments")
        XCTAssertEqual(id3Tag?.frames[.Language]?.id3Identifier, "TLAN")
        XCTAssertEqual((id3Tag?.frames[.Language] as? ID3FrameLanguage)?.language, .eng)
        XCTAssertEqual(id3Tag?.frames[.UserDefinedTextInformation]?.id3Identifier, "TXXX")
        XCTAssertEqual((id3Tag?.frames[.UserDefinedTextInformation] as? ID3FrameUserDefinedText)?.content, "User Defined Text")
        XCTAssertEqual((id3Tag?.frames[.UserDefinedTextInformation] as? ID3FrameUserDefinedText)?.description, "UserDefinedText")
        XCTAssertEqual(id3Tag?.frames[.UserDefinedUrl]?.id3Identifier, "WXXX")
        XCTAssertEqual((id3Tag?.frames[.UserDefinedUrl] as? ID3FrameUserDefinedText)?.content, "http://UserDefinedUrl.com")
        XCTAssertEqual((id3Tag?.frames[.UserDefinedUrl] as? ID3FrameUserDefinedText)?.description, "UserDefinedUrl")
    }
    
    func testReadNewFramesV4() throws {
        let path = PathLoader().pathFor(name: "example-newframes-v4-written", fileType: "mp3")
        // See testReadNewFramesV2 for an explanation of the duplication.
        _ = try? id3TagEditor.read(from: path)
        let id3Tag = try id3TagEditor.read(from: path)
        
        XCTAssertEqual(id3Tag?.properties.version, .version4)
        XCTAssertEqual((id3Tag?.frames[.Arranger] as? ID3FrameWithStringContent)?.id3Identifier, "TPE4")
        XCTAssertEqual((id3Tag?.frames[.Arranger] as? ID3FrameWithStringContent)?.content, "Arranger")
        XCTAssertEqual((id3Tag?.frames[.ArtistUrl] as? ID3FrameWithStringContent)?.id3Identifier, "WOAR")
        XCTAssertEqual((id3Tag?.frames[.ArtistUrl] as? ID3FrameWithStringContent)?.content, "http://ArtistUrl.com")
        XCTAssertEqual((id3Tag?.frames[.AudioFileUrl] as? ID3FrameWithStringContent)?.id3Identifier, "WOAF")
        XCTAssertEqual((id3Tag?.frames[.AudioFileUrl] as? ID3FrameWithStringContent)?.content, "http://AudioFileUrl.com")
        XCTAssertEqual((id3Tag?.frames[.AudioSourceUrl] as? ID3FrameWithStringContent)?.id3Identifier, "WOAS")
        XCTAssertEqual((id3Tag?.frames[.AudioSourceUrl] as? ID3FrameWithStringContent)?.content, "http://AudioSourceUrl.com")
        XCTAssertEqual((id3Tag?.frames[.BPM] as? ID3FrameWithStringContent)?.id3Identifier, "TBPM")
        XCTAssertEqual((id3Tag?.frames[.BPM] as? ID3FrameWithStringContent)?.content, "99")
        XCTAssertEqual((id3Tag?.frames[.Comment] as? ID3FrameCommentTypes)?.id3Identifier, "COMM")
        XCTAssertEqual((id3Tag?.frames[.Comment] as? ID3FrameCommentTypes)?.language, .und)
        XCTAssertEqual((id3Tag?.frames[.Comment] as? ID3FrameCommentTypes)?.description, "Comment Description")
        XCTAssertEqual((id3Tag?.frames[.Comment] as? ID3FrameCommentTypes)?.content, "Comments")
        XCTAssertEqual((id3Tag?.frames[.Composer] as? ID3FrameWithStringContent)?.id3Identifier, "TCOM")
        XCTAssertEqual((id3Tag?.frames[.Composer] as? ID3FrameWithStringContent)?.content, "Composer")
        XCTAssertEqual((id3Tag?.frames[.Conductor] as? ID3FrameWithStringContent)?.id3Identifier, "TPE3")
        XCTAssertEqual((id3Tag?.frames[.Conductor] as? ID3FrameWithStringContent)?.content, "Conductor")
        XCTAssertEqual((id3Tag?.frames[.Copyright] as? ID3FrameWithStringContent)?.id3Identifier, "TCOP")
        XCTAssertEqual((id3Tag?.frames[.Copyright] as? ID3FrameWithStringContent)?.content, "2020 Copyright")
        XCTAssertEqual((id3Tag?.frames[.CopyrightUrl] as? ID3FrameWithStringContent)?.id3Identifier, "WCOP")
        XCTAssertEqual((id3Tag?.frames[.CopyrightUrl] as? ID3FrameWithStringContent)?.content, "http://CopyrightUrl.com")
        XCTAssertEqual((id3Tag?.frames[.ContentGroup] as? ID3FrameWithStringContent)?.id3Identifier, "TIT1")
        XCTAssertEqual((id3Tag?.frames[.ContentGroup] as? ID3FrameWithStringContent)?.content, "Content Group")
        XCTAssertEqual((id3Tag?.frames[.EncodedBy] as? ID3FrameWithStringContent)?.id3Identifier, "TENC")
        XCTAssertEqual((id3Tag?.frames[.EncodedBy] as? ID3FrameWithStringContent)?.content, "EncodedBy")
        XCTAssertEqual((id3Tag?.frames[.EncoderSettings] as? ID3FrameWithStringContent)?.id3Identifier, "TSSE")
        XCTAssertEqual((id3Tag?.frames[.EncoderSettings] as? ID3FrameWithStringContent)?.content, "EncoderSettings")
        XCTAssertEqual((id3Tag?.frames[.FileOwner] as? ID3FrameWithStringContent)?.id3Identifier, "TOWN")
        XCTAssertEqual((id3Tag?.frames[.FileOwner] as? ID3FrameWithStringContent)?.content, "File Owner")
        XCTAssertEqual((id3Tag?.frames[.FileType] as? ID3FrameWithStringContent)?.id3Identifier, "TFLT")
        XCTAssertEqual((id3Tag?.frames[.FileType] as? ID3FrameWithStringContent)?.content, "File Type")
        XCTAssertEqual((id3Tag?.frames[.InitialKey] as? ID3FrameWithStringContent)?.id3Identifier, "TKEY")
        XCTAssertEqual((id3Tag?.frames[.InitialKey] as? ID3FrameWithStringContent)?.content, "b#")
        XCTAssertEqual((id3Tag?.frames[.ISRC] as? ID3FrameWithStringContent)?.id3Identifier, "TSRC")
        XCTAssertEqual((id3Tag?.frames[.ISRC] as? ID3FrameWithStringContent)?.content, "012345678901")
        XCTAssertEqual((id3Tag?.frames[.ITunesGrouping] as? ID3FrameWithStringContent)?.id3Identifier, "GRP1")
        XCTAssertEqual((id3Tag?.frames[.ITunesGrouping] as? ID3FrameWithStringContent)?.content, "Grouping")
//        XCTAssertEqual((id3Tag?.frames[.ITunesMovementCount] as? ID3FrameWithIntegerContent)?.value, 13)
//        XCTAssertEqual((id3Tag?.frames[.ITunesMovementIndex] as? ID3FrameWithIntegerContent)?.value, 6)
        XCTAssertEqual((id3Tag?.frames[.ITunesMovementName] as? ID3FrameWithStringContent)?.id3Identifier, "MVNM")
        XCTAssertEqual((id3Tag?.frames[.ITunesMovementName] as? ID3FrameWithStringContent)?.content, "Movement Name")
        XCTAssertEqual((id3Tag?.frames[.Language] as? ID3FrameLanguage)?.id3Identifier, "TLAN")
        XCTAssertEqual((id3Tag?.frames[.Language] as? ID3FrameLanguage)?.language, .eng)
        XCTAssertEqual((id3Tag?.frames[.Length] as? ID3FrameWithStringContent)?.id3Identifier, "TLEN")
        XCTAssertEqual((id3Tag?.frames[.Length] as? ID3FrameWithStringContent)?.content, "9767")
        XCTAssertEqual((id3Tag?.frames[.Lyricist] as? ID3FrameWithStringContent)?.id3Identifier, "TEXT")
        XCTAssertEqual((id3Tag?.frames[.Lyricist] as? ID3FrameWithStringContent)?.content, "Lyricist")
        XCTAssertEqual((id3Tag?.frames[.MediaType] as? ID3FrameWithStringContent)?.id3Identifier, "TMED")
        XCTAssertEqual((id3Tag?.frames[.MediaType] as? ID3FrameWithStringContent)?.content, "Media Type")
        XCTAssertEqual((id3Tag?.frames[.Mood] as? ID3FrameWithStringContent)?.id3Identifier, "TMOO")
        XCTAssertEqual((id3Tag?.frames[.Mood] as? ID3FrameWithStringContent)?.content, "Mood")
        XCTAssertEqual((id3Tag?.frames[.OriginalAlbum] as? ID3FrameWithStringContent)?.id3Identifier, "TOAL")
        XCTAssertEqual((id3Tag?.frames[.OriginalAlbum] as? ID3FrameWithStringContent)?.content, "Original Album")
        XCTAssertEqual((id3Tag?.frames[.OriginalArtist] as? ID3FrameWithStringContent)?.id3Identifier, "TOPE")
        XCTAssertEqual((id3Tag?.frames[.OriginalArtist] as? ID3FrameWithStringContent)?.content, "Original Artist")
        XCTAssertEqual((id3Tag?.frames[.OriginalFilename] as? ID3FrameWithStringContent)?.id3Identifier, "TOFN")
        XCTAssertEqual((id3Tag?.frames[.OriginalFilename] as? ID3FrameWithStringContent)?.content, "Original Filename")
        XCTAssertEqual((id3Tag?.frames[.OriginalLyricist] as? ID3FrameWithStringContent)?.id3Identifier, "TOLY")
        XCTAssertEqual((id3Tag?.frames[.OriginalLyricist] as? ID3FrameWithStringContent)?.content, "Original Lyricist")
        XCTAssertEqual((id3Tag?.frames[.PlaylistDelay] as? ID3FrameWithStringContent)?.id3Identifier, "TDLY")
        XCTAssertEqual((id3Tag?.frames[.PlaylistDelay] as? ID3FrameWithStringContent)?.content, "20")
//        XCTAssertEqual((id3Tag?.frames[.PodcastCategory] as? ID3FrameWithStringContent)?.id3Identifier, "TCAT")
//        XCTAssertEqual((id3Tag?.frames[.PodcastCategory] as? ID3FrameWithStringContent)?.content, "PodcastCategory")
//        XCTAssertEqual((id3Tag?.frames[.PodcastDescription] as? ID3FrameWithStringContent)?.id3Identifier, "TDES")
//        XCTAssertEqual((id3Tag?.frames[.PodcastDescription] as? ID3FrameWithStringContent)?.content, "PodcastDescription")
//        XCTAssertEqual((id3Tag?.frames[.PodcastID] as? ID3FrameWithStringContent)?.id3Identifier, "TGID")
//        XCTAssertEqual((id3Tag?.frames[.PodcastID] as? ID3FrameWithStringContent)?.content, "PodcastID")
//        XCTAssertEqual((id3Tag?.frames[.PodcastKeywords] as? ID3FrameWithStringContent)?.id3Identifier, "TKWD")
//        XCTAssertEqual((id3Tag?.frames[.PodcastKeywords] as? ID3FrameWithStringContent)?.content, "PodcastKeywords")
        XCTAssertEqual((id3Tag?.frames[.PodcastUrl] as? ID3FrameWithStringContent)?.id3Identifier, "WFED")
        XCTAssertEqual((id3Tag?.frames[.PodcastUrl] as? ID3FrameWithStringContent)?.content, "http://PodcastUrl.com")
        XCTAssertEqual((id3Tag?.frames[.Publisher] as? ID3FrameWithStringContent)?.id3Identifier, "TPUB")
        XCTAssertEqual((id3Tag?.frames[.Publisher] as? ID3FrameWithStringContent)?.content, "Publisher")
        XCTAssertEqual((id3Tag?.frames[.PublisherUrl] as? ID3FrameWithStringContent)?.id3Identifier, "WPUB")
        XCTAssertEqual((id3Tag?.frames[.PublisherUrl] as? ID3FrameWithStringContent)?.content, "http://PublisherUrl.com")
        XCTAssertEqual((id3Tag?.frames[.RadioStation] as? ID3FrameWithStringContent)?.id3Identifier, "TRSN")
        XCTAssertEqual((id3Tag?.frames[.RadioStation] as? ID3FrameWithStringContent)?.content, "Radio Station")
        XCTAssertEqual((id3Tag?.frames[.RadioStationOwner] as? ID3FrameWithStringContent)?.id3Identifier, "TRSO")
        XCTAssertEqual((id3Tag?.frames[.RadioStationOwner] as? ID3FrameWithStringContent)?.content, "Radio Station Owner")
        XCTAssertEqual((id3Tag?.frames[.RadioStationUrl] as? ID3FrameWithStringContent)?.id3Identifier, "WORS")
        XCTAssertEqual((id3Tag?.frames[.RadioStationUrl] as? ID3FrameWithStringContent)?.content, "http://RadioStationUrl.com")
        XCTAssertEqual((id3Tag?.frames[.SetSubtitle] as? ID3FrameWithStringContent)?.id3Identifier, "TSST")
        XCTAssertEqual((id3Tag?.frames[.SetSubtitle] as? ID3FrameWithStringContent)?.content, "SetSubtitle")
        XCTAssertEqual((id3Tag?.frames[.SortAlbum] as? ID3FrameWithStringContent)?.id3Identifier, "TSOA")
        XCTAssertEqual((id3Tag?.frames[.SortAlbum] as? ID3FrameWithStringContent)?.content, "Sort Album")
        XCTAssertEqual((id3Tag?.frames[.SortAlbumArtist] as? ID3FrameWithStringContent)?.id3Identifier, "TSO2")
        XCTAssertEqual((id3Tag?.frames[.SortAlbumArtist] as? ID3FrameWithStringContent)?.content, "Sort Album Artist")
        XCTAssertEqual((id3Tag?.frames[.SortArtist] as? ID3FrameWithStringContent)?.id3Identifier, "TSOP")
        XCTAssertEqual((id3Tag?.frames[.SortArtist] as? ID3FrameWithStringContent)?.content, "Sort Artist")
        XCTAssertEqual((id3Tag?.frames[.SortComposer] as? ID3FrameWithStringContent)?.id3Identifier, "TSOC")
        XCTAssertEqual((id3Tag?.frames[.SortComposer] as? ID3FrameWithStringContent)?.content, "Sort Composer")
        XCTAssertEqual((id3Tag?.frames[.SortTitle] as? ID3FrameWithStringContent)?.id3Identifier, "TSOT")
        XCTAssertEqual((id3Tag?.frames[.SortTitle] as? ID3FrameWithStringContent)?.content, "Sort Title")
        XCTAssertEqual((id3Tag?.frames[.Subtitle] as? ID3FrameWithStringContent)?.id3Identifier, "TIT3")
        XCTAssertEqual((id3Tag?.frames[.Subtitle] as? ID3FrameWithStringContent)?.content, "Subtitle")
        XCTAssertEqual((id3Tag?.frames[.UnsyncedLyrics] as? ID3FrameCommentTypes)?.id3Identifier, "USLT")
        XCTAssertEqual((id3Tag?.frames[.UnsyncedLyrics] as? ID3FrameCommentTypes)?.language, .eng)
        XCTAssertEqual((id3Tag?.frames[.UnsyncedLyrics] as? ID3FrameCommentTypes)?.description, "LyricsTest")
        XCTAssertEqual((id3Tag?.frames[.UnsyncedLyrics] as? ID3FrameCommentTypes)?.content, "Lyrics")
        XCTAssertEqual((id3Tag?.frames[.UserDefinedTextInformation] as? ID3FrameUserDefinedText)?.id3Identifier, "TXXX")
        XCTAssertEqual((id3Tag?.frames[.UserDefinedTextInformation] as? ID3FrameUserDefinedText)?.content, "User Defined Text")
        XCTAssertEqual((id3Tag?.frames[.UserDefinedTextInformation] as? ID3FrameUserDefinedText)?.description, "UserDefinedText")
        XCTAssertEqual((id3Tag?.frames[.UserDefinedUrl] as? ID3FrameUserDefinedText)?.id3Identifier, "WXXX")
        XCTAssertEqual((id3Tag?.frames[.UserDefinedUrl] as? ID3FrameUserDefinedText)?.content, "http://UserDefinedUrl.com")
        XCTAssertEqual((id3Tag?.frames[.UserDefinedUrl] as? ID3FrameUserDefinedText)?.description, "UserDefinedUrl")
    }
    
    //MARK: write
    
    func testWriteNewFramesV2() throws {
        let pathMp3ToCompare = PathLoader().pathFor(name: "example-newframes-v2-written", fileType: "mp3")
        let generationURL = PathLoader.testOutputDirectory
            .appendingPathComponent("example-newframes-v2-generated.mp3")
        try? FileManager.default.removeItem(at: generationURL)
        let pathMp3Generated = generationURL.path
        let id3Tag = ID3Tag(
            version: .version2,
            frames: [
                .Arranger : ID3FrameWithStringContent(content: "Arranger"),
                .ArtistUrl : ID3FrameWithStringContent(content: "http://V2ArtistUrl.com"),
                .AudioFileUrl : ID3FrameWithStringContent(content: "http://V2AudioFileUrl.com"),
                .AudioSourceUrl : ID3FrameWithStringContent(content: "http://V2AudioSourceUrl.com"),
                .BPM : ID3FrameWithStringContent(content: "99"),
                .Comment : ID3FrameCommentTypes(language: .und, description: "commentTest", content: "Comment"),
                .Composer : ID3FrameWithStringContent(content: "Composer"),
                .Conductor : ID3FrameWithStringContent(content: "Conductor"),
                .ContentGroup : ID3FrameWithStringContent(content: "ContentGroup"),
                .Copyright : ID3FrameWithStringContent(content: "Copyright"),
                .CopyrightUrl : ID3FrameWithStringContent(content: "http://V2CopyrightUrl.com"),
                .DiscPosition : ID3FramePartOfTotal(part: 3, total: 4),
                .EncodedBy : ID3FrameWithStringContent(content: "EncodedBy"),
                .EncoderSettings : ID3FrameWithStringContent(content: "EncoderSettings"),
                .FileType : ID3FrameWithStringContent(content: "File Type"),
                .InitialKey : ID3FrameWithStringContent(content: "b#"),
                .ISRC : ID3FrameWithStringContent(content: "012345678901"),
                .Language : ID3FrameLanguage(language: .und),
                .Length : ID3FrameWithStringContent(content: "9744"),
                .Lyricist : ID3FrameWithStringContent(content: "Lyricist"),
                .MediaType : ID3FrameWithStringContent(content: "Media Type"),
                .OriginalAlbum : ID3FrameWithStringContent(content: "Original Album"),
                .OriginalArtist : ID3FrameWithStringContent(content: "Original Artist"),
                .OriginalFilename : ID3FrameWithStringContent(content: "Original Filename"),
                .OriginalLyricist : ID3FrameWithStringContent(content: "Original Lyricist"),
                .PlaylistDelay : ID3FrameWithStringContent(content: "Playlist Delay"),
                .Publisher : ID3FrameWithStringContent(content: "Publisher"),
                .PublisherUrl : ID3FrameWithStringContent(content: "http://V2PublisherUrl.com"),
                .Subtitle : ID3FrameWithStringContent(content: "Subtitle"),
                .UnsyncedLyrics : ID3FrameCommentTypes(language: .und, description: "lyricsTest", content: "UnsyncedLyrics"),
                .UserDefinedTextInformation : ID3FrameUserDefinedText(description: "description", content: "UserDefinedTextInformation"),
                .UserDefinedUrl : ID3FrameUserDefinedText(description: "UserDefinedUrl", content: "http://V2UserDefinedUrl.com"),

            ]
        )
        
        XCTAssertNoThrow(try id3TagEditor.write(
            tag: id3Tag,
            to: PathLoader().pathFor(name: "example-newframes", fileType: "mp3"),
            andSaveTo: pathMp3Generated
            ))
        let generated = try Data(contentsOf: URL(fileURLWithPath: pathMp3Generated))
        let expected = try Data(contentsOf: URL(fileURLWithPath: pathMp3ToCompare))
        XCTAssertEqual(
            generated,
            expected,
            generated.describeDifference(from: expected)
        )
    }
    
    func testWriteNewFramesV3() {
        let pathMp3ToCompare = PathLoader().pathFor(name: "example-newframes-v3-written", fileType: "mp3")
        let generationURL = PathLoader.testOutputDirectory
             .appendingPathComponent("example-newframes-v3-generated.mp3")
        try? FileManager.default.removeItem(at: generationURL)
        let pathMp3Generated = generationURL.path
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [
                .Arranger : ID3FrameWithStringContent(content: "Arranger V3"),
                .ArtistUrl : ID3FrameWithStringContent(content: "http://V3ArtistUrl.com"),
                .AudioFileUrl : ID3FrameWithStringContent(content: "http://V3AudioFileUrl.com"),
                .AudioSourceUrl : ID3FrameWithStringContent(content: "http://V3AudioSourceUrl.com"),
                .BPM : ID3FrameWithStringContent(content: "BPM V3"),
                .Comment : ID3FrameCommentTypes(language: .und, description: "CommentTest V3", content: "Comments V3"),
                .Composer : ID3FrameWithStringContent(content: "Composer V3"),
                .Conductor : ID3FrameWithStringContent(content: "Conductor V3"),
                .ContentGroup : ID3FrameWithStringContent(content: "ContentGroup V3"),
                .Copyright : ID3FrameWithStringContent(content: "Copyright V3"),
                .CopyrightUrl : ID3FrameWithStringContent(content: "http://V3CopyrightUrl.com"),
                .DiscPosition : ID3FramePartOfTotal(part: 1, total: 3),
                .EncodedBy : ID3FrameWithStringContent(content: "EncodedBy V3"),
                .EncoderSettings : ID3FrameWithStringContent(content: "EncoderSettings V3"),
                .FileType : ID3FrameWithStringContent(content: "FileType V3"),
                .FileOwner : ID3FrameWithStringContent(content: "FileOwner V3"),
                .InitialKey : ID3FrameWithStringContent(content: "Initial Key V3"),
                .ISRC : ID3FrameWithStringContent(content: "ISRC V3"),
                .ITunesGrouping : ID3FrameWithStringContent(content: "ItunesGrouping V3"),
                .ITunesMovementCount : ID3FrameWithIntegerContent(value: 13),
                .ITunesMovementIndex : ID3FrameWithIntegerContent(value: 6),
                .ITunesMovementName : ID3FrameWithStringContent(content: "MovementName V3"),
                .Language : ID3FrameLanguage(language: .und),
                .Length : ID3FrameWithStringContent(content: "Length V3"),
                .Lyricist : ID3FrameWithStringContent(content: "Lyricist V3"),
                .MediaType : ID3FrameWithStringContent(content: "MediaType V3"),
                .OriginalAlbum : ID3FrameWithStringContent(content: "Original Album V3"),
                .OriginalArtist : ID3FrameWithStringContent(content: "Original Artist V3"),
                .OriginalFilename : ID3FrameWithStringContent(content: "Original Filename V3"),
                .OriginalLyricist : ID3FrameWithStringContent(content: "Original Lyricist V3"),
                .PlaylistDelay : ID3FrameWithStringContent(content: "Playlist Delay V3"),
                .PodcastCategory : ID3FrameWithStringContent(content: "PodcastCategory V3"),
                .PodcastDescription : ID3FrameWithStringContent(content: "PodcastDescription V3"),
                .PodcastID : ID3FrameWithStringContent(content: "PodcastID V3"),
                .PodcastKeywords : ID3FrameWithStringContent(content: "PodcastKeywords V3"),
                .PodcastUrl : ID3FrameWithStringContent(content: "http://V3PodcastUrl.com"),
                .Publisher : ID3FrameWithStringContent(content: "Publisher V3"),
                .PublisherUrl : ID3FrameWithStringContent(content: "http://V3PublisherUrl.com"),
                .RadioStation : ID3FrameWithStringContent(content: "Radio Station V3"),
                .RadioStationOwner : ID3FrameWithStringContent(content: "Radio Station Owner V3"),
                .RadioStationUrl : ID3FrameWithStringContent(content: "http://V3RadioStationUrl.com"),
                .SortAlbum : ID3FrameWithStringContent(content: "Sort Album V3"),
                .SortArtist : ID3FrameWithStringContent(content: "Sort Artist V3"),
                .SortAlbumArtist : ID3FrameWithStringContent(content: "Sort Album Artist V3"),
                .SortComposer : ID3FrameWithStringContent(content: "Sort Composer V3"),
                .SortTitle : ID3FrameWithStringContent(content: "Sort Title V3"),
                .Subtitle : ID3FrameWithStringContent(content: "Subtitle V3"),
                .UnsyncedLyrics : ID3FrameCommentTypes(language: .und, description: "LyricsTest V3", content: "UnsyncedLyrics V3"),
                .UserDefinedTextInformation : ID3FrameUserDefinedText(description: "description", content: "UserDefinedTextInformation V3"),
                .UserDefinedUrl : ID3FrameUserDefinedText(description: "UserDefinedUrl", content: "http://V3UserDefinedUrl.com"),
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
                .ArtistUrl : ID3FrameWithStringContent(content: "http://ArtistUrl.com"),
                .AudioFileUrl : ID3FrameWithStringContent(content: "http://AudioFileUrl.com"),
                .AudioSourceUrl : ID3FrameWithStringContent(content: "http://AudioSourceUrl.com"),
                .BPM : ID3FrameWithStringContent(content: "BPM"),
                .Comment : ID3FrameCommentTypes(language: .und, description: "CommentTest", content: "Comments"),
                .Composer : ID3FrameWithStringContent(content: "Composer"),
                .Conductor : ID3FrameWithStringContent(content: "Conductor"),
                .ContentGroup : ID3FrameWithStringContent(content: "ContentGroup"),
                .Copyright : ID3FrameWithStringContent(content: "Copyright"),
                .CopyrightUrl : ID3FrameWithStringContent(content: "http://CopyrightUrl.com"),
                .DiscPosition : ID3FramePartOfTotal(part: 1, total: 3),
                .EncodedBy : ID3FrameWithStringContent(content: "EncodedBy"),
                .EncoderSettings : ID3FrameWithStringContent(content: "EncoderSettings"),
                .FileType : ID3FrameWithStringContent(content: "FileType"),
                .FileOwner : ID3FrameWithStringContent(content: "FileOwner"),
                .InitialKey : ID3FrameWithStringContent(content: "InitialKey"),
                .ISRC : ID3FrameWithStringContent(content: "ISRC"),
                .ITunesGrouping : ID3FrameWithStringContent(content: "ItunesGrouping"),
                .ITunesMovementCount : ID3FrameWithIntegerContent(value: 13),
                .ITunesMovementIndex : ID3FrameWithIntegerContent(value: 6),
                .ITunesMovementName : ID3FrameWithStringContent(content: "MovementName"),
                .Language : ID3FrameLanguage(language: .und),
                .Length : ID3FrameWithStringContent(content: "Length"),
                .Lyricist : ID3FrameWithStringContent(content: "Lyricist"),
                .MediaType : ID3FrameWithStringContent(content: "MediaType"),
                .Mood : ID3FrameWithStringContent(content: "Mood"),
                .OriginalAlbum : ID3FrameWithStringContent(content: "Original Album"),
                .OriginalArtist : ID3FrameWithStringContent(content: "Original Artist"),
                .OriginalFilename : ID3FrameWithStringContent(content: "Original Filename"),
                .OriginalLyricist : ID3FrameWithStringContent(content: "Original Lyricist"),
                .PlaylistDelay : ID3FrameWithStringContent(content: "Playlist Delay"),
                .PodcastCategory : ID3FrameWithStringContent(content: "PodcastCategory"),
                .PodcastDescription : ID3FrameWithStringContent(content: "PodcastDescription"),
                .PodcastID : ID3FrameWithStringContent(content: "PodcastID"),
                .PodcastKeywords : ID3FrameWithStringContent(content: "PodcastKeywords"),
                .PodcastUrl : ID3FrameWithStringContent(content: "http://PodcastUrl.com"),
                .Publisher : ID3FrameWithStringContent(content: "Publisher"),
                .PublisherUrl : ID3FrameWithStringContent(content: "http://PublisherUrl.com"),
                .RadioStation : ID3FrameWithStringContent(content: "Radio Station"),
                .RadioStationOwner : ID3FrameWithStringContent(content: "Radio Station Owner"),
                .RadioStationUrl : ID3FrameWithStringContent(content: "http://RadioStationUrl.com"),
                .SetSubtitle : ID3FrameWithStringContent(content: "Set Subtitle"),
                .SortAlbum : ID3FrameWithStringContent(content: "Sort Album"),
                .SortAlbumArtist : ID3FrameWithStringContent(content: "Sort Album Artist"),
                .SortArtist : ID3FrameWithStringContent(content: "Sort Artist"),
                .SortComposer : ID3FrameWithStringContent(content: "Sort Composer"),
                .SortTitle : ID3FrameWithStringContent(content: "Sort Title"),
                .Subtitle : ID3FrameWithStringContent(content: "Subtitle"),
                .UnsyncedLyrics : ID3FrameCommentTypes(language: .und, description: "LyricsTest", content: "UnsyncedLyrics"),
                .UserDefinedTextInformation : ID3FrameUserDefinedText(description: "description", content: "UserDefinedTextInformation"),
                .UserDefinedUrl : ID3FrameUserDefinedText(description: "UserDefinedUrl", content: "http://UserDefinedUrl.com"),
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
