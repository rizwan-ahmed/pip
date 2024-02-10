//
//  PipStatus.swift
//  PictureInPicture
//
//  Created by Macbook Pro on 10/02/2024.
//

import Foundation
enum PipStatus {
    case willStart
    case didStart
    case willStop
    case didStop
    case undefined

    var description: String {
        switch self {
        case .willStart: return "Will Start"
        case .didStart: return "Did Start"
        case .willStop: return "Will Stop"
        case .didStop: return "Did Stop"
        case .undefined: return "Undefined"
        }
    }
}
