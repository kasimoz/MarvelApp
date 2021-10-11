//
//  FavoriteCharactersViewController.swift
//  MarvelApp
//
//  Created by KasimOzdemir on 10.10.2021.
//

import UIKit
import Combine

class FavoriteCharactersViewController: UITableViewController {
    var viewModel: FavoriteCharactersViewModel?
    
    private var characters : [MarvelCharacter] = []
    
    private var cancellables: Set<AnyCancellable> = []

    private var idFavoriteTableViewCell = "FavoriteTableViewCell"
        
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.setTitleAttributes()
        self.navigationBar.topItem?.title = Constants.Title.Favorites
        
        self.setTableView()
        self.reloadTableView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel?.viewDidDisappear()
    }
    
    deinit {
        print("deinit FavoriteCharactersViewController")
    }
    
    func reloadTableView(){
        self.viewModel?.$characters.sink{ characters in
            self.characters = characters ?? []
            self.tableView.reloadData()
        }.store(in: &cancellables)
        self.viewModel?.fetchCharacters()
    }
    
    func setTableView(){
        self.tableView.register(UINib(nibName: idFavoriteTableViewCell, bundle: nil), forCellReuseIdentifier: idFavoriteTableViewCell)
        self.tableView.separatorColor = .random
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idFavoriteTableViewCell, for: indexPath) as! FavoriteTableViewCell
        let imageUrl = "\(self.characters[indexPath.row].thumbnail?.path ?? "").\(self.characters[indexPath.row].thumbnail?.extension_ ?? "")"
        cell.setCharacterCell(name: self.characters[indexPath.row].name ?? "", description: self.characters[indexPath.row].description ?? "", imageUrl: imageUrl)
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }

    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.viewModel?.removeFromFavorites(id: self.characters[indexPath.row].id!)
            self.characters.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

}
