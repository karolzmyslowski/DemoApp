//
//  UserDetailsVC.swift
//  DemoAppL
//
//  Created by Karol Zmysłowski on 29/05/2019.
//  Copyright © 2019 Karol. All rights reserved.
//

import UIKit
import SnapKit

protocol UserDetailsVCDelegate: class {
    
    func reloadAllRows()
}

final class UserDetailsVC: UIViewController {
    
    // MARK: VAR - VIEW
    var tableView: UITableView!
    var userProfileImageView: ImageViewWithGradient!
    
    // MARK: - ViewModel
    var viewModel: UserDetailsProtocol
    
    // MARK: - Init
    init(viewModel: UserDetailsProtocol) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildUI()
        setupBackButton()
        setupEditButton()
        viewModel.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - UI
extension UserDetailsVC {
    
    private func buildUI() {
        view.backgroundColor = .white
        
        tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.registerCellClasses([ActivityCell.self])
        
        view.addSubview(tableView)
        
        userProfileImageView = ImageViewWithGradient(image: #imageLiteral(resourceName: "defaultImage"))
        userProfileImageView.contentMode = .scaleToFill
        
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.locations = [0.0, 1.0]
        
        view.addSubview(userProfileImageView)
        
        let userNameLabel = UILabel()
        userNameLabel.font = UIFont(name: "Raleway-SemiBold", size: 20.0)
        userNameLabel.textColor = .white
        userNameLabel.text = viewModel.getUser().name
        let userMailLabel = UILabel()
        userMailLabel.font = UIFont(name: "Raleway-Regular", size: 14.0)
        userMailLabel.textColor = .white
        let userPhoneLabel = UILabel()
        userPhoneLabel.font = UIFont(name: "Raleway-Regular", size: 14.0)
        userPhoneLabel.textColor = .white
        let addressTitleLabel = UILabel()
        let addressLabel = UILabel()
        let companyTitleLabel = UILabel()
        let companyLabel = UILabel()
        let webTitleLabel = UILabel()
        let webLabel = UILabel()
        let activityLabel = UILabel()
        
        userNameLabel.text = viewModel.getUser().name
        userMailLabel.text = viewModel.getUser().email
        userPhoneLabel.text = viewModel.getUser().phone
        addressTitleLabel.text = "Adres"
        addressLabel.text = viewModel.getUser().address.street
        companyTitleLabel.text = "Firma"
        companyLabel.text = viewModel.getUser().company.name
        webTitleLabel.text = "Strona"
        webLabel.text = viewModel.getUser().website
        activityLabel.text = "Aktywności"
        
        [addressTitleLabel, companyTitleLabel, webTitleLabel, activityLabel].forEach {
            $0.font = UIFont(name: "Raleway-SemiBold", size: 14.0)
        }
        [addressLabel, companyLabel, webLabel].forEach {
            $0.font = UIFont(name: "Raleway-Regular", size: 14.0)
            $0.textColor = UIColor.subTitle
        }
        
        let imageLabelStackView = UIStackView(arrangedSubviews: [userNameLabel, userMailLabel, userPhoneLabel])
        imageLabelStackView.axis = .vertical
        imageLabelStackView.spacing = 8
        view.addSubview(imageLabelStackView)
        
        let addreesStackView = UIStackView(arrangedSubviews: [addressTitleLabel, addressLabel])
        let companyStackView = UIStackView(arrangedSubviews: [companyTitleLabel, companyLabel])
        let webStackView = UIStackView(arrangedSubviews: [webTitleLabel, webLabel])
        [addreesStackView, companyStackView, webStackView].forEach {
            $0.spacing = 6
            $0.axis = .vertical
        }
        
        let infoLabelStackView = UIStackView(arrangedSubviews: [addreesStackView, companyStackView, webStackView])
        infoLabelStackView.axis = .vertical
        infoLabelStackView.spacing = 14
        view.addSubview(infoLabelStackView)
        
        view.addSubview(activityLabel)
        
        userProfileImageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalTo(userProfileImageView.snp.width)
        }
        
        imageLabelStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(25)
            $0.bottom.equalTo(userProfileImageView.snp.bottom).offset(-16)
        }
        
        infoLabelStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(25)
            $0.top.equalTo(userProfileImageView.snp.bottom).offset(31)
        }
        
        activityLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(25)
            $0.top.equalTo(infoLabelStackView.snp.bottom).offset(20)
        }
        
        tableView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.top.equalTo(activityLabel.snp.bottom)
        }
    }
    
    private func setupBackButton() {
        let backButton = UIButton()
        backButton.setTitle("◀︎", for: .normal)
        backButton.tintColor = .white
        backButton.addTarget(self, action: #selector(didTouchBackButton), for: .touchUpInside)
        view.addSubview(backButton)
        
        backButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview().offset(19)
        }
    }
    
    private func setupEditButton() {
        let editButton = UIButton()
        editButton.backgroundColor = UIColor.mainBlue
        editButton.setImage(#imageLiteral(resourceName: "pencil"), for: .normal)
        editButton.layer.cornerRadius = 33
        editButton.clipsToBounds = true
        view.addSubview(editButton)
        
        editButton.snp.makeConstraints {
            $0.centerY.equalTo(userProfileImageView.snp.bottom)
            $0.trailing.equalToSuperview().offset(-31)
            $0.height.equalTo(66)
            $0.width.equalTo(66)
        }
    }
    
    @objc private func didTouchBackButton(sender: UIButton) {
        viewModel.finish()
    }
}

// MARK: - UITableViewDelegate
extension UserDetailsVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

// MARK: - UITableViewDataSource
extension UserDetailsVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 97
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getPostsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let activityCell = tableView.dequeueReusableCell() as ActivityCell
        let post = viewModel.getPost(for: indexPath.row)
        activityCell.title = post.title
        activityCell.subTitle = post.body
        activityCell.cellImage = #imageLiteral(resourceName: "defaultImage")
        activityCell.update()
        
        return activityCell
    }
}

// MARK: - UserDetailsVCDelegate
extension UserDetailsVC: UserDetailsVCDelegate {
    
    func reloadAllRows() {
        DispatchQueue.main.async { [weak tableView] in
            tableView?.reloadData()
        }
    }
}
