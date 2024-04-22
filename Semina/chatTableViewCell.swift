//
//  chatTableViewCell.swift
//  Semina
//
//  Created by 이지훈 on 4/20/24.
//

import UIKit
import SnapKit
import Then

class chatTableViewCell: UITableViewCell {
    
    static let identifier = "ChatTableViewCell"

    
    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .black
        imageView.image = UIImage(named: "chat")
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "djfkjdkfjd"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "Pretendard-Bold", size: 15)
        return label
    }()
    
    private let placeLabel: UILabel = {
        let label = UILabel()
        label.text = "djfkjdkfjd"
        label.textColor = UIColor(red: 156, green: 156, blue: 156, alpha: 1)
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 12)
        return label
    }()
    
    private let chatLabel: UILabel = {
        let label = UILabel()
        label.text = "djfkjdkfjd"
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 14)
        return label
    }()
    
    private let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .black
        imageView.image = UIImage(named: "chat")
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setLayout()
    }
    
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        [profileImage, nameLabel, placeLabel, chatLabel, itemImageView].forEach {
            self.contentView.addSubview($0)
        }
        
        profileImage.snp.makeConstraints {
            $0.leading.top.equalToSuperview().offset(16)
            $0.size.equalTo(40)
        }
        
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImage.snp.trailing).offset(16)
            $0.top.equalToSuperview().offset(16.5)
        }
        
        placeLabel.snp.makeConstraints {
            $0.leading.equalTo(nameLabel.snp.trailing).offset(4)
            $0.top.equalTo(nameLabel).offset(2)
        }
        
        chatLabel.snp.makeConstraints {
            $0.top.equalTo(placeLabel.snp.bottom).offset(4)
            $0.leading.equalTo(nameLabel)
        }
        
        itemImageView.snp.makeConstraints {
            $0.trailing.top.equalToSuperview().inset(16)
            $0.size.equalTo(40)
        }
    }
    
    
}
extension chatTableViewCell {
    func dataBind(_ chatData: ChatModel) {
        profileImage.image = chatData.profileImg
        nameLabel.text = chatData.name
        placeLabel.text = chatData.place
        chatLabel.text = chatData.message
        itemImageView.image = chatData.itemImg
    }
}
