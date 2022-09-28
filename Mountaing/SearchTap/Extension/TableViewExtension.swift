//
//  TableViewExtension.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/22.
//

import UIKit


extension SearchViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.isFiltering ? filteredRealm.count : localRealm.objects(MountainModel.self).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.reuseIdentifier, for: indexPath) as! SearchTableViewCell
        
        let modelArray : [MountainModel] = localRealm.objects(MountainModel.self).map { $0 }
        cell.backgroundColor = .white
        
        //검색창이 활성화 될 때
        if self.isFiltering {
            
            if indexPath.row < filteredRealm.count {
                cell.titleLabel.text = filteredRealm[indexPath.row].title
                cell.locationLabel.text = "\(filteredRealm[indexPath.row].altitude)m"
                
            } //searchbar에 기록한 텍스트들
            var textFirstIndex: Int = 0 // 검색중인 키워드가 가장 처음으로 나온 인덱스를 저장할 변수 선언.
            let keyword = modelArray[indexPath.row].text
            let labelText = filteredRealm[indexPath.row].title
            let labelHeight = filteredRealm[indexPath.row].altitude
            let attributeString = NSMutableAttributedString(string: labelText)
            let secondattributeString = NSMutableAttributedString(string: labelHeight)
            
            print("----------\(keyword)")
            
            if let textFirstRange = labelText.range(of: keyword , options: .caseInsensitive){ // 검색중인 키워드가 있을 때에만 색상 변경 - 검색중인 키워드가 가장 처음으로 일치하는 문자열의 범위를 알아낼 수 있음. (caseInsensitive:대소문자 구분X)
                textFirstIndex = labelText.distance(from: labelText.startIndex, to: textFirstRange.lowerBound) // 거리(인덱스) 구해서 저장.
                attributeString.addAttribute(.foregroundColor, value: UIColor.systemGreen, range: NSRange(location: textFirstIndex, length: keyword.count))
                
                if let heightFirstRange = labelHeight.range(of: keyword, options: .caseInsensitive){
                    textFirstIndex = labelHeight.distance(from: labelText.startIndex, to: textFirstRange.lowerBound) // 거리(인덱스) 구해서 저장.
                    attributeString.addAttribute(.foregroundColor, value: UIColor.systemGreen, range: NSRange(location: textFirstIndex, length: keyword.count))
                    
                }
            }
            cell.titleLabel.attributedText = attributeString // ex) "제주" 위트 에일(JEJU Wit ale)
            cell.locationLabel.attributedText = secondattributeString
             
        } else {
            
            cell.titleLabel.text = modelArray[indexPath.row].title
            cell.locationLabel.text = modelArray[indexPath.row].location
        }
        return cell
    }
    

func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 120
}

func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let selectedRow = indexPath.row
    let modelArray : [MountainModel] = localRealm.objects(MountainModel.self).map { $0 }
    
    try! localRealm.write {
        modelArray[selectedRow].selected = !modelArray[selectedRow].selected
    }
   
    
    let vc = InfoViewController()
    self.navigationController?.pushViewController(vc, animated: true)
    
}

}

