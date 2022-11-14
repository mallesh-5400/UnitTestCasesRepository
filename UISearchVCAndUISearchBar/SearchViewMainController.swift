//
//  SearchViewMainController.swift
//  UnitTestCasesRepository
//
//  Created by user227716 on 11/11/22.
//

import UIKit

class SearchViewMainController: UIViewController, UISearchResultsUpdating {
   

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Search"
        let searchVeiwVC = SearchViewController(searchResultsController: SearchResultVC())
        
        //Line no. 18 is not a recommended way of creating instace of UISearchController
        //navigationItem.searchController = UISearchController(searchResultsController: SearchResultVC())
        
        searchVeiwVC.searchResultsUpdater = self
        searchVeiwVC.searchBar.delegate = self
        navigationItem.searchController = searchVeiwVC

       
    }
    
    //This function will be called for every single character we type in searchbar.
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        
        print(text)
    }

}

extension SearchViewMainController: UISearchBarDelegate {
    
}

class SearchResultVC: UIViewController {

    //This VC will be called the moment some text or character entered in the UISearchBar of SearchViewController.
    override func viewDidLoad() {
        super.viewDidLoad()

        print("\(#function) of SeachResultVC called")
        
    }
}

class SearchViewController: UISearchController {
    
    override init(searchResultsController: UIViewController?) {
        super.init(searchResultsController: searchResultsController)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(#function) of class SearchViewController is called")
    }
}

//navigationItem.backButtonTitle = "v" //this assignment not working
//
////Here setting navigation.title property will override the value of view's title mentioned above
//navigationItem.title = "Hello"
//
////navigationItem.backButtonDisplayMode = .minimal
//// navigationItem.largeTitleDisplayMode = .always
//
//navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil) //this assignment also not working
