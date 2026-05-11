//
//  OTPInputModel.swift
//  Tikim
//
//  Created by Rashad on 11.03.26.
//

import SwiftUI

struct OTPInputModel: Hashable, Identifiable {
    let id = UUID()
    var number: Character?
    var isFocused: Bool
}
