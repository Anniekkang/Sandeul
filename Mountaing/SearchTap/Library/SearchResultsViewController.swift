//
//  SearchResultsViewController.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/20.
//

import UIKit
import InstantSearch

class SearchResultsViewController: UITableViewController, HitsController {

    var hitsSource: HitsInteractor<item>?
       
     override func viewDidLoad() {
       super.viewDidLoad()
       tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
     }
         
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       hitsSource?.numberOfHits() ?? 0
     }
     
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
         cell.textLabel?.text = hitsSource?.hit(atIndex: indexPath.row)?.mntnNm
       return cell
     }
     
     override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       if let _ = hitsSource?.hit(atIndex: indexPath.row) {
         // Handle hit selection
       }
     }

}
