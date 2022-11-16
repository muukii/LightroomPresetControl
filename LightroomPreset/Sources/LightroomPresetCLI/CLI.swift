import Foundation
import ArgumentParser
import LightroomPreset
import XMLCoder

struct CLIError: Swift.Error, LocalizedError, Equatable {
  
  var errorDescription: String?
  
  static var somethingFailed: Self = .init(errorDescription: "Something's failed")
  
}

struct CLI: AsyncParsableCommand {
  
  static var configuration: CommandConfiguration = .init(subcommands: [
    Subcommand.self,
    Play.self
  ])
  
  struct Subcommand: AsyncParsableCommand {
    
    /*
     @Argument(help: "arg1") var arg1: String
     @Option(name: .long, help: "option1") var option1: String?
     */
    
    mutating func run() async throws {
      
      // run
      
    }
    
  }
  
  struct Play: AsyncParsableCommand {
    
    @Argument(help: "arg1") var arg1: String
    /*
     @Option(name: .long, help: "option1") var option1: String?
     */
    
    mutating func run() async throws {
      
      let url = URL(fileURLWithPath: arg1)
      let data = try Data(contentsOf: url)
      let string = String(data: data, encoding: .utf8)!

      let p = try Preset(text: string)
      
      let t = try p.export()
      
      print(t)
      
    }
    
  }
}

@main
enum Main {
  static func main() async {
    await CLI.main()
  }
}
