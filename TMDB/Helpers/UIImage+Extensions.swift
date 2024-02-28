//
//  UIImage+Extensions.swift
//  TMDB
//
//  Created by Nicolle on 27/02/24.
//

import UIKit
import SwiftUI

extension UIImage {
    func predominantColor() -> Color? {
        guard let inputImage = CIImage(image: self) else { return nil }

        let filter = CIFilter(
            name: "CIAreaAverage",
            parameters: [
                kCIInputImageKey: inputImage,
                kCIInputExtentKey: CIVector(cgRect: inputImage.extent)
            ]
        )

        guard let outputImage = filter?.outputImage else { return nil }

        var bitmap = [UInt8](repeating: 0, count: 4)

        let context = CIContext(options: [.workingColorSpace: kCFNull as Any])

        context.render(
            outputImage,
            toBitmap: &bitmap,
            rowBytes: 4,
            bounds: CGRect(x: 0, y: 0, width: 1, height: 1),
            format: .RGBA8,
            colorSpace: nil
        )
        return Color(
            UIColor(
                red: CGFloat(bitmap[0]) / 255,
                green: CGFloat(bitmap[1]) / 255,
                blue: CGFloat(bitmap[2]) / 255,
                alpha: CGFloat(bitmap[3]) / 255
            )
        )
    }
}
