//
//  AllRepositriesVC.swift
//  CashUTask
//
//  Created by Sherif  Wagih on 6/20/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit
import ProgressHUD
import SwiftMessages
class AllRepositriesVC: BaseCVController,UICollectionViewDelegateFlowLayout {
    
    var results:[Repo] = [Repo]()
    var isPaginating = false
    var isDoneLoadingData = false
    var currentPage:Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupNavigationController()
        results = getSavedRepositries()
        if results.count == 0
        {
            getRepositryData(page: currentPage)
        }
        else
        {
            currentPage = results.count / 15
        }
    }
    
    
    fileprivate func getRepositryData(page:Int)
    {
        if !Connectivity.isConnectedToInternet()
        {
            showMessage(body: "You are not connected to the internet", theme: .error)
            return
        }
        if !isDoneLoadingData
        {
            showMessage(body: "Loading Data", theme: .info)
            let url = "https://api.github.com/users/JakeWharton/repos?page=\(page)&per_page=15"
            Service().fetchGenericJSONData(urlString: url) {[weak self] (fetchingResult:[Repo]?, err:Error?) in
                
                if let err = err
                {
                    self?.showMessage(body: err.localizedDescription, theme: .error)
                    return
                }
                else if let res = fetchingResult
                {
                    self?.results += res
                    self?.currentPage = page
                    if res.count == 0
                    {
                        self?.isDoneLoadingData = true
                        self?.showMessage(body: "There are no more data to show", theme: .info)
                    }
                }
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
                self?.isPaginating = false
                self?.handleSaveData()
            }
        }
      
    }
    
    internal func paginateData(item:Int)
    {
        if item == results.count - 3 && !isPaginating
        {
            isPaginating = true
            getRepositryData(page: currentPage + 1)
        }
    }
    let userDefaultsKey:String = "userDefaultsKey"
    
    func getSavedRepositries() -> [Repo]
    {
        if let data = UserDefaults.standard.value(forKey:"SavedRepo") as? Data {
            do
            {
                let results = try PropertyListDecoder().decode(Array<Repo>.self, from: data)
                return results

            }
            catch
            {
                showMessage(body: "Unable to retrieve data", theme: .error)
            }
        }
        return [Repo]()
    }
    func handleSaveData()
    {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(results), forKey:"SavedRepo")
    }
    
}
