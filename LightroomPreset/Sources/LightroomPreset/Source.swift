import SwiftyXMLParser
import Foundation

///
/// https://www.adobe.com/products/xmp.html
public struct Preset {
  
  public init(text: String) throws {
    
    let accessor = try XML.parse(text)
    
    let root = accessor["x:xmpmeta"]
    
    root.attributes
    
  }
  
}
