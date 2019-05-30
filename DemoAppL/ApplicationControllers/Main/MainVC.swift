//
//  MainVC.swift
//  DemoAppL
//
//  Created by Karol Zmysłowski on 28/05/2019.
//  Copyright © 2019 Karol. All rights reserved.
//

import UIKit
import SnapKit

protocol MainVCDelegate: class {
    
    func reloadAllRows()
}

final class MainVC: UIViewController {
    
    // MARK: VAR - VIEW
    var tableView: UITableView!
    
    // MARK: - ViewModel
    var viewModel: MainScreenProtocol
    
    // MARK: - Init
    init(viewModel: MainScreenProtocol) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildUI()
        viewModel.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - UI
extension MainVC {
    
    private func buildUI() {
        view.backgroundColor = .white
        navigationItem.title = "Profile"
        
        tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.registerCellClasses([MainCell.self])
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: - UITableViewDelegate
extension MainVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.selectUser(at: indexPath.row)
    }
}

// MARK: - UITableViewDataSource
extension MainVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getUsersCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mainCell = tableView.dequeueReusableCell() as MainCell
        let user = viewModel.getUser(for: indexPath.row)
        mainCell.title = user.name
        mainCell.firstSubTitle = user.email
        mainCell.secoundSubTitle = user.phone
        mainCell.cellImage = #imageLiteral(resourceName: "defaultImage")
        
        return mainCell
    }
}

extension MainVC: MainVCDelegate {
    
    func reloadAllRows() {
        DispatchQueue.main.async { [weak tableView] in
            tableView?.reloadData()
        }
    }
}
