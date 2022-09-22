//
//  TableViewExtension.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/22.
//

import UIKit


extension SearchViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.isFiltering ? self.filteredArray.count : self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.reuseIdentifier, for: indexPath) as! SearchTableViewCell
        
        cell.backgroundColor = .white
        
        
        if self.isFiltering {
            if indexPath.row < filteredArray.count {
                cell.titleLabel.text = self.filteredArray[indexPath.row].mntnnm
                cell.contentLabel.text = "\(self.filteredArray[indexPath.row].mntninfohght)m"
            } else {
                }
            }
        
        cell.titleLabel.text = items[indexPath.row].mntnnm
        cell.contentLabel.text = "\(items[indexPath.row].mntninfohght)m"
        
        var textFirstIndex: Int = 0 // 검색중인 키워드가 가장 처음으로 나온 인덱스를 저장할 변수 선언.
        var keyword = UISearchController(searchResultsController: nil).searchBar.text
        let text = items[indexPath.row].mntnnm
        let attributeString = NSMutableAttributedString(string: text)
        
        
        if let textFirstRange = text.range(of: keyword! , options: .caseInsensitive) { // 검색중인 키워드가 있을 때에만 색상 변경 - 검색중인 키워드가 가장 처음으로 일치하는 문자열의 범위를 알아낼 수 있음. (caseInsensitive:대소문자 구분X)
            textFirstIndex = text.distance(from: text.startIndex, to: textFirstRange.lowerBound) // 거리(인덱스) 구해서 저장.
            
            attributeString.addAttribute(.foregroundColor, value: UIColor.systemGreen, range: NSRange(location: textFirstIndex, length: keyword!.count)) // 텍스트 색상(yellow) 변경.
            attributeString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: FontSize.large.rawValue), range: NSRange(location: textFirstIndex, length: keyword!.count)) // 기존 사이즈 변경 없이 bold처리 :
            cell.titleLabel.attributedText = attributeString // ex) "제주" 위트 에일(JEJU Wit ale)
            cell.selectionStyle = .none // 테이블뷰 cell 선택시 배경색상 없애기 : https://gonslab.tistory.com/41 | https://sweetdev.tistory.com/105
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let vc = InfoViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}
