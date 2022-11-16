import SwiftyXMLParser
import Foundation
import GrainDescriptor

///
/// https://www.adobe.com/products/xmp.html
public struct Preset: GrainView {
  
  public let uuid: String
  public let effects: Effects
  
  public init(text: String) throws {
    
    let accessor = try XML.parse(text)
    
    let root = accessor["x:xmpmeta"]
    guard case .singleElement(let element) = root["rdf:RDF"]["rdf:Description"] else {
      fatalError("Invalid text")
    }
    let e = element.attributes
    
    self.effects = Effects(
      texture: e["crs:Texture"],
      clarity: e["crs:Clarity2012"],
      dehaze: e["crs:Dehaze"]
    )

    let presetType = e["crs:PresetType"]
    let cluster = e["crs:Cluster"]
    self.uuid = e["crs:UUID"] ?? UUID().uuidString
    let supportsAmount2 = e["crs:SupportsAmount2"]
    let supportsAmount = e["crs:SupportsAmount"]
    let supportsColor = e["crs:SupportsColor"]
    let supportsMonochrome = e["crs:SupportsMonochrome"]
    let supportsHighDynamicRange = e["crs:SupportsHighDynamicRange"]
    let supportsNormalDynamicRange = e["crs:SupportsNormalDynamicRange"]
    let supportsSceneReferred = e["crs:SupportsSceneReferred"]
    let supportsOutputReferred = e["crs:SupportsOutputReferred"]
    let requiresRGBTables = e["crs:RequiresRGBTables"]
    let cameraModelRestriction = e["crs:CameraModelRestriction"]
    let copyright = e["crs:Copyright"]
    let contactInfo = e["crs:ContactInfo"]
    let version = e["crs:Version"]
    let processVersion = e["crs:ProcessVersion"]
    let contrast2012 = e["crs:Contrast2012"]
    let highlights2012 = e["crs:Highlights2012"]
    let shadows2012 = e["crs:Shadows2012"]
    let whites2012 = e["crs:Whites2012"]
    let blacks2012 = e["crs:Blacks2012"]
    let vibrance = e["crs:Vibrance"]
    let saturation = e["crs:Saturation"]
    let parametricShadows = e["crs:ParametricShadows"]
    let parametricDarks = e["crs:ParametricDarks"]
    let parametricLights = e["crs:ParametricLights"]
    let parametricHighlights = e["crs:ParametricHighlights"]
    let parametricShadowSplit = e["crs:ParametricShadowSplit"]
    let parametricMidtoneSplit = e["crs:ParametricMidtoneSplit"]
    let parametricHighlightSplit = e["crs:ParametricHighlightSplit"]
    let sharpness = e["crs:Sharpness"]
    let sharpenRadius = e["crs:SharpenRadius"]
    let sharpenDetail = e["crs:SharpenDetail"]
    let sharpenEdgeMasking = e["crs:SharpenEdgeMasking"]
    let luminanceSmoothing = e["crs:LuminanceSmoothing"]
    let luminanceNoiseReductionDetail = e["crs:LuminanceNoiseReductionDetail"]
    let luminanceNoiseReductionContrast = e["crs:LuminanceNoiseReductionContrast"]
    let colorNoiseReduction = e["crs:ColorNoiseReduction"]
    let colorNoiseReductionDetail = e["crs:ColorNoiseReductionDetail"]
    let colorNoiseReductionSmoothness = e["crs:ColorNoiseReductionSmoothness"]
    let hueAdjustmentRed = e["crs:HueAdjustmentRed"]
    let hueAdjustmentOrange = e["crs:HueAdjustmentOrange"]
    let hueAdjustmentYellow = e["crs:HueAdjustmentYellow"]
    let hueAdjustmentGreen = e["crs:HueAdjustmentGreen"]
    let hueAdjustmentAqua = e["crs:HueAdjustmentAqua"]
    let hueAdjustmentBlue = e["crs:HueAdjustmentBlue"]
    let hueAdjustmentPurple = e["crs:HueAdjustmentPurple"]
    let hueAdjustmentMagenta = e["crs:HueAdjustmentMagenta"]
    let saturationAdjustmentRed = e["crs:SaturationAdjustmentRed"]
    let saturationAdjustmentOrange = e["crs:SaturationAdjustmentOrange"]
    let saturationAdjustmentYellow = e["crs:SaturationAdjustmentYellow"]
    let saturationAdjustmentGreen = e["crs:SaturationAdjustmentGreen"]
    let saturationAdjustmentAqua = e["crs:SaturationAdjustmentAqua"]
    let saturationAdjustmentBlue = e["crs:SaturationAdjustmentBlue"]
    let saturationAdjustmentPurple = e["crs:SaturationAdjustmentPurple"]
    let saturationAdjustmentMagenta = e["crs:SaturationAdjustmentMagenta"]
    let luminanceAdjustmentRed = e["crs:LuminanceAdjustmentRed"]
    let luminanceAdjustmentOrange = e["crs:LuminanceAdjustmentOrange"]
    let luminanceAdjustmentYellow = e["crs:LuminanceAdjustmentYellow"]
    let luminanceAdjustmentGreen = e["crs:LuminanceAdjustmentGreen"]
    let luminanceAdjustmentAqua = e["crs:LuminanceAdjustmentAqua"]
    let luminanceAdjustmentBlue = e["crs:LuminanceAdjustmentBlue"]
    let luminanceAdjustmentPurple = e["crs:LuminanceAdjustmentPurple"]
    let luminanceAdjustmentMagenta = e["crs:LuminanceAdjustmentMagenta"]
    let splitToningShadowHue = e["crs:SplitToningShadowHue"]
    let splitToningShadowSaturation = e["crs:SplitToningShadowSaturation"]
    let splitToningHighlightHue = e["crs:SplitToningHighlightHue"]
    let splitToningHighlightSaturation = e["crs:SplitToningHighlightSaturation"]
    let splitToningBalance = e["crs:SplitToningBalance"]
    let colorGradeMidtoneHue = e["crs:ColorGradeMidtoneHue"]
    let colorGradeMidtoneSat = e["crs:ColorGradeMidtoneSat"]
    let colorGradeShadowLum = e["crs:ColorGradeShadowLum"]
    let colorGradeMidtoneLum = e["crs:ColorGradeMidtoneLum"]
    let colorGradeHighlightLum = e["crs:ColorGradeHighlightLum"]
    let colorGradeBlending = e["crs:ColorGradeBlending"]
    let colorGradeGlobalHue = e["crs:ColorGradeGlobalHue"]
    let colorGradeGlobalSat = e["crs:ColorGradeGlobalSat"]
    let colorGradeGlobalLum = e["crs:ColorGradeGlobalLum"]
    let autoLateralCA = e["crs:AutoLateralCA"]
    let lensProfileEnable = e["crs:LensProfileEnable"]
    let defringePurpleAmount = e["crs:DefringePurpleAmount"]
    let defringePurpleHueLo = e["crs:DefringePurpleHueLo"]
    let defringePurpleHueHi = e["crs:DefringePurpleHueHi"]
    let defringeGreenAmount = e["crs:DefringeGreenAmount"]
    let defringeGreenHueLo = e["crs:DefringeGreenHueLo"]
    let defringeGreenHueHi = e["crs:DefringeGreenHueHi"]
    let grainAmount = e["crs:GrainAmount"]
    let grainSize = e["crs:GrainSize"]
    let grainFrequency = e["crs:GrainFrequency"]
    let postCropVignetteAmount = e["crs:PostCropVignetteAmount"]
    let postCropVignetteMidpoint = e["crs:PostCropVignetteMidpoint"]
    let postCropVignetteFeather = e["crs:PostCropVignetteFeather"]
    let postCropVignetteRoundness = e["crs:PostCropVignetteRoundness"]
    let postCropVignetteStyle = e["crs:PostCropVignetteStyle"]
    let postCropVignetteHighlightContrast = e["crs:PostCropVignetteHighlightContrast"]
    let shadowTint = e["crs:ShadowTint"]
    let redHue = e["crs:RedHue"]
    let redSaturation = e["crs:RedSaturation"]
    let greenHue = e["crs:GreenHue"]
    let greenSaturation = e["crs:GreenSaturation"]
    let blueHue = e["crs:BlueHue"]
    let blueSaturation = e["crs:BlueSaturation"]
    let overrideLookVignette = e["crs:OverrideLookVignette"]
    let toneCurveName2012 = e["crs:ToneCurveName2012"]
    let lensProfileSetup = e["crs:LensProfileSetup"]
    let hasSettings = e["crs:HasSettings"]
    
  }
  
  public var body: some GrainView {
    
    GrainObject {
      GrainAttribute("xmlns:x", value: "adobe:ns:meta/")
      GrainAttribute("x:xmptk", value: "Adobe XMP Core 7.0-c000 1.000000, 0000/00/00-00:00:00")
     
      GrainMember("rdf:RDF") {
        GrainObject {
          GrainAttribute("xmlns:rdf", value: "http://www.w3.org/1999/02/22-rdf-syntax-ns#")
          
          GrainMember("rdf:Description") {
            GrainObject {
              
              effects.body.spread
//              GrainAttribute("xmlns:rdf", value: "http://www.w3.org/1999/02/22-rdf-syntax-ns#")
            }
          }
        }
      }
     
    }
    
  }
  
  public func export() throws -> String {
    
    let encoded = try XMLEncoder().encode(self, withRootKey: "x:xmpmeta")
    return String(data: encoded, encoding: .utf8)!
    
  }
}

import XMLCoder

struct GrainAttribute: GrainView, Encodable, XMLAttributeProtocol {
  
  struct CustomStringKey: CodingKey {
    var stringValue: String
    
    init?(stringValue: String) {
      self.stringValue = stringValue
    }
    
    var intValue: Int?
    
    init?(intValue: Int) {
      return nil
    }
    
  }
    
  typealias Body = Never
    
  private let name: String
  private let value: String?
  
  init(_ name: String, value: String?) {
    self.name = name
    self.value = value
  }
    
  func encode(to encoder: Encoder) throws {
    if let value {
      var container = encoder.container(keyedBy: CustomStringKey.self)
      try container.encode(Attribute(value), forKey: .init(stringValue: name)!)
    }
  }
}

extension Preset {
  
  public struct Light: GrainView {
    
    public struct Curve: GrainView {
      
      let rgb: [String]
      let r: [String]
      let g: [String]
      let b: [String]
      
      public var body: some GrainView {
        GrainObject {
          GrainMember("crs:ToneCurvePV2012") {
            GrainMember("rdf:Seq") {
              rgb.map { value in
                GrainMember("rdf:li") {
                  value
                }
              }
            }
          }
          GrainMember("crs:ToneCurvePV2012Red") {
            GrainMember("rdf:Seq") {
              r.map { value in
                GrainMember("rdf:li") {
                  value
                }
              }
            }
          }
          GrainMember("crs:ToneCurvePV2012Green") {
            GrainMember("rdf:Seq") {
              g.map { value in
                GrainMember("rdf:li") {
                  value
                }
              }
            }
          }
          GrainMember("crs:ToneCurvePV2012Blue") {
            GrainMember("rdf:Seq") {
              b.map { value in
                GrainMember("rdf:li") {
                  value
                }
              }
            }
          }
        }
      }
      
    }
    
    public var body: some GrainView {
      GrainMember("crs:ToneCurvePV2012") {
        GrainMember("crs:ToneCurvePV2012") {
          
        }
      }
    }
  }
  
  public struct Color {
    
  }
  
  public struct Effects: GrainView {
    let texture: String?
    let clarity: String?
    let dehaze: String?
    
    public var body: GrainObject {
      
      GrainObject {
        GrainAttribute("crs:Texture", value: texture)
        GrainAttribute("crs:Clarity2012", value: clarity)
        GrainAttribute("crs:Dehaze", value: clarity)
      }
      
    }
  }
  
  public struct Detail {
    
  }
  
  public struct Optics {
    
  }
}
