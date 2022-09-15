//
//  UIImage+Ext.swift
//  Martin Pulgar Construction Demo
//
//  Created by Dmitrii Zverev on 15/9/2022.
//

import UIKit

extension UIImage {
    var base64: String? { jpegData(compressionQuality: 0.75)?.base64EncodedString() }
}
