//
//  UserListViewController.swift
//  UserGallery
//
//  Created by Jose Vildosola on 24-02-20.
//  Copyright © 2020 Jose Vildosola. All rights reserved.
//

import UIKit

protocol MakeUserListViewControllerFactory {
    func makeUserDetailViewController(userId: Int) -> UIViewController
}

class UserListViewController: UIViewController {

    @IBOutlet weak var searchBarView: UISearchBar!
    @IBOutlet weak var usersTableView: UITableView!
    
    private var usersDataSource: [UserListViewModel]?
    private var presenter: UserListPresenter!
    private var makeUserDetailFactory: MakeUserListViewControllerFactory!
    private var loadingIndicatorManager = LoadingIndicatorManager()
    
    static func create(presenter: UserListPresenter, makeUserDetailFactory: MakeUserListViewControllerFactory) -> UserListViewController {
        let viewController = UserListViewController.instantiate(from: .UserList)
        viewController.presenter = presenter
        viewController.makeUserDetailFactory = makeUserDetailFactory
        viewController.presenter.view = viewController
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usersTableView.dataSource = self
        usersTableView.delegate = self
        searchBarView.delegate = self
        self.title = "Users"
        // GET USERS
        self.presenter.getUsers()
    }
}

extension UserListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let dataSource = usersDataSource {
            if !searchBarView.text!.isEmpty {
                    let ds = dataSource.filter { (model) -> Bool in
                        model.username.contains(searchBarView!.text!)
                        
                    }
                    return ds.count
            } else {
                return dataSource.count
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UserTableViewCell.self)) as! UserTableViewCell
        if let dataSource = usersDataSource {
            if !searchBarView.text!.isEmpty {
                let ds = dataSource.filter { (model) -> Bool in
                    model.username.contains(searchBarView!.text!)
                    
                }
                if !ds.isEmpty {
                    cell.configure(with: ds[indexPath.row])
                }
            } else {
                cell.configure(with: dataSource[indexPath.row])
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if let ds = usersDataSource {
            let destinationVC = makeUserDetailFactory.makeUserDetailViewController(userId: ds[indexPath.row].id)
            navigationController?.pushViewController(destinationVC, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}

extension UserListViewController: UserListView {
    func showLoading() {
        // TODO: Agregar i18n
        DispatchQueue.main.async {
            self.loadingIndicatorManager.addLoadingMessage("Loading", view: self.view)
        }
    }
    
    func hideLoading() {
        DispatchQueue.main.async {
            self.loadingIndicatorManager.removeLoadingIndicator()
        }
    }
    
    func setUsers(_ users: [UserListViewModel]) {
        usersDataSource = users
        DispatchQueue.main.async {
            self.usersTableView.reloadData()
        }
    }
}

extension UserListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        usersTableView.reloadData()
    }
}
