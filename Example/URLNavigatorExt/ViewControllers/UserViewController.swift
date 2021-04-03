//
//  UserViewController.swift
//  URLNavigatorExample
//
//  Created by Suyeol Jeon on 7/12/16.
//  Copyright © 2016 Suyeol Jeon. All rights reserved.
//

import UIKit
import URLNavigator
import URLNavigatorExt

// sourcery: router: desc="user detail page"
// sourcery: router: name="user_detail"
// sourcery: router: path="user/detail"
// sourcery: router: parameter="name:String"
final class UserViewController: UIViewController, Navigatorible {
    var navigator: NavigatorType!
    private var parameter: Router.PRUser_Detail?
    init(navigator: NavigatorType, parameterible: Parameterible?) {
        self.navigator = navigator
        super.init(nibName: nil, bundle: nil)
        self.parameter = parameterible as? Router.PRUser_Detail
    }


  // MARK: Properties
  var repos = [Repo]()


  // MARK: UI

  let tableView = UITableView()


  // MARK: Initializing

  init(navigator: NavigatorType, username: String) {
    self.navigator = navigator
    super.init(nibName: nil, bundle: nil)
    self.title = "\(username)'s Repositories"
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }


  // MARK: View Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.addSubview(self.tableView)

    self.tableView.dataSource = self
    self.tableView.delegate = self
    self.tableView.register(RepoCell.self, forCellReuseIdentifier: "cell")
    guard let name = self.parameter?.name else {
        return
    }
    GitHub.repos(username: name) { [weak self] result in
      guard let `self` = self else { return }
      self.repos = (result.value ?? []).sorted { $0.starCount > $1.starCount }
      self.tableView.reloadData()
    }
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    if self.navigationController?.viewControllers.count ?? 0 > 1 { // pushed
      self.navigationItem.leftBarButtonItem = nil
    } else if self.presentingViewController != nil { // presented
      self.navigationItem.leftBarButtonItem = UIBarButtonItem(
        barButtonSystemItem: .done,
        target: self,
        action: #selector(doneButtonDidTap)
      )
    }
  }


  // MARK: Layout

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    self.tableView.frame = self.view.bounds
  }


  // MARK: Actions

  @objc func doneButtonDidTap() {
    self.dismiss(animated: true, completion: nil)
  }
}


// MARK: - UITableViewDataSource

extension UserViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.repos.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RepoCell
    let repo = self.repos[indexPath.row]
    cell.textLabel?.text = repo.name
    cell.detailTextLabel?.text = repo.descriptionText
    cell.detailTextLabel?.textColor = .gray
    cell.accessoryType = .disclosureIndicator
    return cell
  }
}


// MARK: - UITableViewDelegate

extension UserViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: false)
    let repo = self.repos[indexPath.row]
    let webViewController = self.navigator.present(repo.urlString, wrap: nil)
    webViewController?.title = "\(self.parameter?.name ?? "")/\(repo.name)"
    print("[Navigator] push: \(repo.urlString)")
  }
}
