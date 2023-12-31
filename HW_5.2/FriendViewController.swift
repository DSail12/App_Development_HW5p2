// 
//  FriendViewController.swift
//  HW_5.2
//
//  Created by Eugene Zvyagin on 12.07.2023.
//

import UIKit

final class FriendViewController: UITableViewController {
    
    private let networkService = NetworkService()
    private var models: [Friend]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Friends"
        view.backgroundColor = .white
        tableView.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(image:UIImage(systemName: "person"),
    style: .plain,
    target: self,
    action: #selector(tap))
        tableView.register(FriendCell.self, forCellReuseIdentifier: "FriendCell")
        networkService.getFriends { [weak self] friends in
            self?.models = friends
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: <#T##IndexPath#>) as? FriendCell else { return UITableViewCell()
        }
        let model = models[indexPath.row]
                           cell.updateCell(model: model)
        return cell
    }
}

private extension FriendViewController {
    @objc func tap() {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        animation.type = .moveIn
        animation.duration = 3
        navigationController?.view.layer.add(animation, forKey: nil)
        navigationController?.pushViewController(ProfileViewController(), animated: false)
    }
}
