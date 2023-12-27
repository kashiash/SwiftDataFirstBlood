//
//  Genre.swift
//  SwiftDataFirstBlood
//
//  Created by Jacek Kosinski U on 18/12/2023.
//

import Foundation
import SwiftData
import UIKit

@Model
final class Genre {
    var name: String
    var books = [Book]()

    @Attribute(.transformable(by: ColorTransformer.self))
    var color: UIColor

    init(name: String, color: UIColor) {
        self.name = name
        self.color = color
    }
}
