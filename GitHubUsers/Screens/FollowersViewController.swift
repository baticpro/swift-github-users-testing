//
//  FollowersViewController.swift
//  GitHubUsers
//
//  Created by batraz jioty on 08.11.2020.
//  Copyright © 2020 batraz jioty. All rights reserved.
//

import UIKit

class FollowersViewController: UIViewController {
    
    enum Section {
        case main
    }
    
    var username: String!
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
    var followers: [Follower] = []
    var page = 1
    var hasMoreFollowers: Bool!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        getFollowers(page: page)
        configureCollectionView()
        configureDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func getFollowers(page: Int)
    {
        showActivityIndicator()
        NetworkManager.shared.getFollowers(for: username, page: page) { [weak self] result in
            guard let self = self else { return }
            self.hideActivityIndicator()
            
            switch result {
            case .success(let followers):
                print(followers.count)
                
                if followers.isEmpty {
                    DispatchQueue.main.async {
                        self.showEmptyMessageView(with: "No user was found", view: self.view)
                    }
                    
                    return
                }
                
                self.followers.append(contentsOf: followers)
                self.hasMoreFollowers = followers.count >= 100
                self.updateCell()
            case .failure(let error):
                self.showAlert(title: "Error!", message: error.rawValue)
            
            }
        }
    }
    
    func configureCollectionView()
    {
        let flowLayout = UIHelper.createThreeColumnFlowLayout(in: view)
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: flowLayout)
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseId)
        collectionView.delegate = self
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, follower) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseId, for: indexPath) as! FollowerCell
            
            cell.set(follower: follower)
            //cell.backgroundColor = .black
            return cell
        })
    }
    
    func updateCell() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followers)
         
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
}


extension FollowersViewController: UICollectionViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.height
        
        
        if offsetY > contentHeight - height {
            guard hasMoreFollowers else {
                return
            }
            
            page += 1
            getFollowers(page: page)
        }
    }
}
