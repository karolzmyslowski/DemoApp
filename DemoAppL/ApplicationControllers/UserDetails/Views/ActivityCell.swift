//
//  ActivityCell.swift
//  DemoAppL
//
//  Created by Karol Zmysłowski on 29/05/2019.
//  Copyright © 2019 Karol. All rights reserved.
//

import UIKit
import SnapKit

final class ActivityCell: UITableViewCell, Identifiable {
    
    var title: String?
    var subTitle: String?
    var cellImage: UIImage?
    
    private var titleLabel: UILabel!
    private var subTitleLabel: UILabel!
    private var cellImaveView: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        buildUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update() {
        titleLabel.text = title
        subTitleLabel.text = subTitle
        cellImaveView.image = cellImage
    }
    
    private func buildUI() {
        
        let outerView = UIView()
        outerView.clipsToBounds = false
        outerView.layer.shadowColor = UIColor.black.cgColor
        outerView.layer.shadowOpacity = 0.24
        outerView.layer.shadowOffset = CGSize(width: 0, height: 9)
        outerView.layer.shadowRadius = 7
        
        cellImaveView = UIImageView()
        cellImaveView.contentMode = .scaleToFill
        cellImaveView.layer.cornerRadius = 12
        cellImaveView.clipsToBounds = true
        outerView.addSubview(cellImaveView)
        contentView.addSubview(outerView)
        
        titleLabel = UILabel()
        titleLabel.font = UIFont(name: "Raleway-SemiBold", size: 14.0)
        titleLabel.textColor = .black
        contentView.addSubview(titleLabel)
        
        subTitleLabel = UILabel()
        subTitleLabel.numberOfLines = 3
        subTitleLabel.textColor = UIColor.subTitle
        subTitleLabel.font = UIFont(name: "Raleway-Regular", size: 12.0)
        contentView.addSubview(subTitleLabel)
        
        outerView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(25)
            $0.top.equalToSuperview().offset(8)
            $0.bottom.equalToSuperview().offset(-8)
            $0.width.equalTo(81)
        }
        
        cellImaveView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(cellImaveView.snp.trailing).offset(12)
            $0.trailing.equalToSuperview().offset(-25)
            $0.top.equalTo(cellImaveView.snp.top)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(cellImaveView.snp.trailing).offset(12)
            $0.top.equalTo(titleLabel.snp.bottom).offset(7)
            $0.trailing.equalToSuperview().offset(-42)
            $0.centerY.equalTo(cellImaveView.snp.centerY)
        }
    }
}
