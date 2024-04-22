//
//  ChatViewController.swift
//  Semina
//
//  Created by 이지훈 on 4/20/24.
//

import UIKit
import SnapKit

final class ChatViewController: UIViewController {

    private let tableView = UITableView(frame: .zero, style: .plain)
    private let chatList = ChatModel.dummy()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setLayout()
        register()
        setDelegate()
        
    }
  
    private func setLayout() { // -- 3번
            self.view.addSubview(tableView)
            
            tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
        }
    
   
    private func register() {
        tableView.register(
            chatTableViewCell.self,
            forCellReuseIdentifier: chatTableViewCell.identifier
        )
    }
    
    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension ChatViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: chatTableViewCell.identifier, for: indexPath) as? chatTableViewCell else { return UITableViewCell() }
        cell.dataBind(chatList[indexPath.row])
        return cell
    }
    
}
