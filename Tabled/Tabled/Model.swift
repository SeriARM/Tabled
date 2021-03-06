import Foundation

class Model {
    static let shared = Model()
    private init() {}
    
    private var items: [String] = []
    
    func addItem(_ item: String) {
        // fill this in
        items.append(item)
        saveData()
    }
    
    func removeItem(at index: Int) {
        // fill this in
        items.remove(at: index)
        saveData()
    }
    
    func moveItem(from index: Int, to destinationIndex: Int) {
        // fill this in
        let item = items.remove(at: index)
        items.insert(item, at: destinationIndex)
        saveData()
    }
    
    func itemCount() -> Int {
        return items.count
    }
    
    func item(at index: Int) -> String {
        return items[index]
    }
    
    let fileURL = URL(fileURLWithPath: NSHomeDirectory())
        .appendingPathComponent("Library")
        .appendingPathComponent("ToDo")
        .appendingPathExtension("plist")
    
    func saveData() {
        try! (items as NSArray).write(to: fileURL)
    }
    
    func loadData() {
        if let items = NSArray(contentsOf: fileURL) as? [String] {
            self.items = items
        }
    }
}
