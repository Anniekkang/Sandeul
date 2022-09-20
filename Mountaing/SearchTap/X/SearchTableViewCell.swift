////
////  SearchTableViewCell.swift
////  Mountaing
////
////  Created by 나리강 on 2022/09/17.
////
//
//import UIKit
//
//class SearchTableViewCell: BaseTableViewCell {
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    let stackView : UIStackView = {
//        let view = UIStackView()
//        view.spacing = 5
//        view.axis = .vertical
//        return view
//    }()
//    
//    let titleLabel : UILabel = {
//        let label = UILabel()
//        label.text = "title"
//        label.textColor = .black
//        label.font = .systemFont(ofSize: 20, weight: .bold)
//        return label
//    }()
//    
//    let contentLabel : UILabel = {
//        let label = UILabel()
//        label.text = "content"
//        label.textColor = .systemGray
//        label.font = .systemFont(ofSize: 15, weight: .medium)
//        return label
//    }()
//    
//    let image : UIImageView = {
//        let view = UIImageView()
//        return view
//    }()
//    
//    override func configure() {
//        [titleLabel,contentLabel].forEach {
//            stackView.addArrangedSubview($0)
//        }
//        [stackView,image].forEach {
//            self.addSubview($0)
//        }
//        
//    }
//    
//    func constraints(){
//        stackView.snp.makeConstraints { make in
//            make.top.leading.bottom.equalToSuperview().inset(5)
//            make.width.equalToSuperview().multipliedBy(0.7)
//            
//        }
//        
//        image.snp.makeConstraints { make in
//            make.top.trailing.bottom.equalToSuperview().inset(5)
//            make.width.equalTo(image.snp.height)
//        }
//        
//        
//        
//    }
//    
//    
//}
