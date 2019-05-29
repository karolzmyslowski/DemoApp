//
//  MainCell.swift
//  DemoAppL
//
//  Created by Karol Zmysłowski on 28/05/2019.
//  Copyright © 2019 Karol. All rights reserved.
//

import UIKit
import SnapKit

final class MainCell: UITableViewCell, Identifiable {

    var title: String?
    var firstSubTitle: String?
    var secoundSubTitle: String?
    var cellImage: UIImage?
    
    private var titleLabel: UILabel!
    private var firstSubTitleLabel: UILabel!
    private var secoundSubTitleLabel: UILabel!
    private var cellImaveView: UIImageView!
    private var mainStackView: UIStackView!
    private var subTitlesStackView: UIStackView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        buildUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update() {
        titleLabel.text = title
        firstSubTitleLabel.text = firstSubTitle
        secoundSubTitleLabel.text = secoundSubTitle
        cellImaveView.image = cellImage
    }
    
    private func buildUI() {
        
        let flameView = UIView()
        flameView.layer.borderColor = UIColor.border.cgColor
        flameView.layer.borderWidth = 1
        flameView.backgroundColor = .clear
        contentView.addSubview(flameView)
        
        cellImaveView = UIImageView()
        cellImaveView.contentMode = .scaleToFill
        cellImaveView.layer.cornerRadius = 20
        cellImaveView.clipsToBounds = true
        contentView.addSubview(cellImaveView)
        
        mainStackView = UIStackView()
        mainStackView.axis = .vertical
        contentView.addSubview(mainStackView)
        
        titleLabel = UILabel()
        titleLabel.font = UIFont(name: "Raleway-Regular", size: 16.0)
        titleLabel.textColor = .black
        mainStackView.addArrangedSubview(titleLabel)
        
        subTitlesStackView = UIStackView()
        subTitlesStackView.axis = .horizontal
        mainStackView.addArrangedSubview(subTitlesStackView)
        
        firstSubTitleLabel = UILabel()
        secoundSubTitleLabel = UILabel()
        secoundSubTitleLabel.textAlignment = .right
        [firstSubTitleLabel, secoundSubTitleLabel].forEach {
            $0!.font = UIFont(name: "Raleway-Regular", size: 12.0)
            $0!.textColor = UIColor.subTitle
            subTitlesStackView.addArrangedSubview($0!)
        }
        
        flameView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.left.equalToSuperview().offset(-1)
            $0.right.equalToSuperview().offset(1)
        }
        
        cellImaveView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(26)
            $0.top.equalToSuperview().offset(12)
            $0.bottom.equalToSuperview().offset(-12)
            $0.width.equalTo(cellImaveView.snp.height)
        }
        
        mainStackView.snp.makeConstraints {
            $0.leading.equalTo(cellImaveView.snp.trailing).offset(19)
            $0.top.equalTo(cellImaveView.snp.top)
            $0.bottom.equalTo(cellImaveView.snp.bottom)
            $0.trailing.equalToSuperview().offset(-26)
        }
    }
}
