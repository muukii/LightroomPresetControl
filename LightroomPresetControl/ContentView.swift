
import SwiftUI
import LightRoo

struct ContentView: View {
  
  @State private var droppedData: String?
  
  var body: some View {
    
    HStack {
      ZStack {
        RoundedRectangle(cornerRadius: 16)
          .foregroundColor(.gray)
        Text("Drop Preset here")
          .padding()
      }
      .padding(16)
      .onDrop(of: [.fileURL], delegate: FileDropDelegate(loadedData: $droppedData))
      .onChange(of: droppedData) { newValue in
        guard let newValue else { return }
        do {
          let preset = try Preset(text: newValue)
          
        } catch {
          
        }
      }
         
    }
    
  }
}


struct FileDropDelegate: DropDelegate {
  
  @Binding var loadedData: String?
  
  func performDrop(info: DropInfo) -> Bool {
    
    print(info)
    
    guard let first = info.itemProviders(for: [.fileURL]).first else {
      return false
    }
        
    _ = first.loadObject(ofClass: URL.self) { (url, error) in
      
      do {
        if let url = url, let string = String(data: try Data(contentsOf: url), encoding: .utf8) {
          loadedData = string
        }
      } catch {
        print(error)
      }
      
    }
    
    return true
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
