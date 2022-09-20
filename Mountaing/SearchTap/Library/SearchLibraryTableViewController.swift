import UIKit
import InstantSearch

struct Item: Codable {
  let name: String
}

class SearchLibraryViewController : UITableViewController, HitsController {
  
  var hitsSource: HitsInteractor<Item>?
    
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
  }
      
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    hitsSource?.numberOfHits() ?? 0
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: SearchLibaryTableViewCell.reuseIdentifier, for: indexPath) as! SearchLibaryTableViewCell
    cell.textLabel?.text = hitsSource?.hit(atIndex: indexPath.row)?.name
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let _ = hitsSource?.hit(atIndex: indexPath.row) {
      // Handle hit selection
    }
  }
  
}

