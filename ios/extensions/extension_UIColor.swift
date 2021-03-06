//
//  extension_UIColor.swift
//  react-native-painter
//
//  Created by Juan J LF on 8/29/21.
//


import UIKit

extension UIColor{
    
    static func parseHex(_ hex: String) -> UIColor? {
          var chars = Array(hex.hasPrefix("#") ? hex.dropFirst() : hex[...])
          let red, green, blue, alpha: CGFloat
          switch chars.count {
          case 3:
              chars = chars.flatMap { [$0, $0] }
              fallthrough
          case 6:
              chars = ["F","F"] + chars
              fallthrough
          case 8:
              alpha = CGFloat(strtoul(String(chars[0...1]), nil, 16)) / 255
              red   = CGFloat(strtoul(String(chars[2...3]), nil, 16)) / 255
              green = CGFloat(strtoul(String(chars[4...5]), nil, 16)) / 255
              blue  = CGFloat(strtoul(String(chars[6...7]), nil, 16)) / 255
          default:
              return nil
          }
         return self.init(red: red, green: green, blue:  blue, alpha: alpha)
      }
    
    static func parseInt(argb: Int)-> UIColor{
        let a = CGFloat((argb >> 24) & 0xFF)
        let r = CGFloat((argb >> 16) & 0xFF)
        let g = CGFloat((argb >> 8) & 0xFF)
        let b = CGFloat(argb & 0xFF)
        return UIColor(red: r / 255, green: g / 255, blue: b / 255, alpha: a / 255)
    }
    
    static func parseInt(argb: Int,opacity:CGFloat)-> UIColor{
        let a = CGFloat((argb >> 24) & 0xFF)
        let r = CGFloat((argb >> 16) & 0xFF)
        let g = CGFloat((argb >> 8) & 0xFF)
        let b = CGFloat(argb & 0xFF)
        return UIColor(red: r / 255, green: g / 255, blue: b / 255, alpha: (a / 255) * opacity)
    }
}
