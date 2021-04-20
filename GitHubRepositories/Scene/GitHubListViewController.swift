//
//  GitHubListViewController.swift
//  GitHubRepositories
//
//  Created by Ramy Nasser on 4/20/21.
//  Copyright © 2021 Ramy Nasser. All rights reserved.
//

import UIKit

class GitHubListViewController: UIViewController {

    @IBOutlet weak var repoListTableView: UITableView!
    
    var presenter = Injector.shared.provideRepoPresenter()
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.fetchGitHubRepositories()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
