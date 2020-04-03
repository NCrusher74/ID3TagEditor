//
//  ID3FrameCreditsList.swift
//
//  Created by Nolaine Crusher 4/1/20
//  2018 Fabrizio Duroni.
//

import Foundation

/**
 A class used to represent an ID3 involved peeople list or musician credits frame.
 */
public class ID3FrameCreditsList: ID3Frame, Equatable, CustomDebugStringConvertible {
    /// An array of the role:person tuples
    public var entries: Array<(String, String)>
    /// The role of the involved person, i.e. instrument, vocal part, production function, or other involvement
    public var role: String
    /// The name (or comma-delimited names) of the person(s) performing a particular role.
    public var person: String
    /// CreditsList description, useful for debug.
    public var debugDescription: String {
        return "entries"
    }
    
    /**
     Init an ID3 involved person and musician credits frame.
     - parameter entries: the array of `role`:`person` pairs
     - parameter role: the role of the involved person.
     - parameter person: the name (or comma-delimited names) of the person fulfilling a given role.
     */
    public init(entries: [(role:String, person:String)]) {
        self.entries = entries
        self.role = role
        self.person = person
    }
    
    /**
     Compare two roles.
     
     - parameter lhs: left side of compare operation.
     - parameter rhs: right side of compare operation.
     
     - returns: true if the role values are the same, else false.
     */
    public static func ==(lhs: ID3FrameCreditsList, rhs: ID3FrameCreditsList) -> Bool {
        return lhs.role == rhs.role
    }
}
