//
//  Extensions.swift
//  NetflixClone
//
//  Created by Şule Kaptan on 6.03.2024.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
