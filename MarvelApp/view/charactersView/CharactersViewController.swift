//
//  CharactersViewController.swift
//  MarvelApp
//
//  Created by KasimOzdemir on 8.10.2021.
//

import UIKit
import Combine

class CharactersViewController: UITableViewController {
    
    var charactersViewModel: CharactersViewModel?
    
    private var cancellables: Set<AnyCancellable> = []
    
    private var characters : [MarvelCharacter] = []
    
    private var charactersIds : [Int] = []
    
    private var idCharacterTableViewCell = "CharacterTableViewCell"
    
    private var offset = 0
        
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.setTableView()
        
        self.setViewModel()
        
        self.setFavoriteBarButton()
        
    }
    
    func setTableView(){
        self.tableView.register(UINib(nibName: idCharacterTableViewCell, bundle: nil), forCellReuseIdentifier: idCharacterTableViewCell)
        self.tableView.separatorColor = .random
    }
    
    func setViewModel(){
        self.charactersViewModel?.$characters.sink{ characters in
            DispatchQueue.main.async {
                self.characters.append(contentsOf: characters ?? [])
                self.tableView.reloadData()
            }
        }.store(in: &cancellables)
        
        self.charactersViewModel?.$showDialog.sink{ value in
            let _ = value ? self.startActivityIndicator() : self.stopActivityIndicator()
        }.store(in: &cancellables)
        
        self.charactersViewModel?.$error.sink{ value in
            self.alertError(message: value?.localizedDescription, completion: nil)
        }.store(in: &cancellables)
        
        self.charactersViewModel?.$charactersIds.sink{ charactersIds in
            self.charactersIds = charactersIds ?? []
            self.tableView.reloadData()
        }.store(in: &cancellables)
        
        self.charactersViewModel?.reloadView()
        self.charactersViewModel?.requestFetchCharacters(offset: offset)
    }
    
    func setFavoriteBarButton(){
        let starListImage = UIImage(systemName: "list.star")
        let barButtonItem = UIBarButtonItem(image: starListImage, style: .plain, target: self, action: #selector(tappedRightBarButton))
        barButtonItem.tintColor = .random
        navigationItem.rightBarButtonItem = barButtonItem
        navigationItem.title = Constants.Title.MarvelCharacters
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc private func tappedRightBarButton(){
        self.charactersViewModel?.didTappedRightButton()
    }

}

extension CharactersViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.characters.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCharacterTableViewCell, for: indexPath) as! CharacterTableViewCell
        let imageUrl = "\(self.characters[indexPath.row].thumbnail?.path ?? "").\(self.characters[indexPath.row].thumbnail?.extension_ ?? "")"
        cell.setCharacterCell(name: self.characters[indexPath.row].name ?? "", imageUrl: imageUrl, isFavorite: self.charactersIds.contains(self.characters[indexPath.row].id ?? 0))
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row + 1 == self.characters.count {
            self.offset += 30
            self.charactersViewModel?.requestFetchCharacters(offset: offset)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.charactersViewModel?.didSelectedCharacter(character: self.characters[indexPath.row])
    }
    
    override func tableView(_ tableView: UITableView,
                            contextMenuConfigurationForRowAt indexPath: IndexPath,
                            point: CGPoint) -> UIContextMenuConfiguration? {
        
        let favorite = UIAction(title: Constants.Title.AddFavorite, image: UIImage(systemName: "star.fill")) { _ in
            self.charactersViewModel?.addToFavorites(marvelCharacter: self.characters[indexPath.row])
        }
        let remove = UIAction(title: Constants.Title.RemoveFavorite, image: UIImage(systemName: "trash.fill")) { _ in
            self.charactersViewModel?.removeFromFavorites(id: self.characters[indexPath.row].id!)
        }
        let identifier = String(indexPath.row)
        return UIContextMenuConfiguration(identifier: identifier as NSCopying,
                                          previewProvider: nil) { _ in
            UIMenu(title: Constants.Title.Marvel, children: self.charactersIds.contains(self.characters[indexPath.row].id ?? 0) ? [remove] : [favorite])
        }
    }
    
    override func tableView(_ tableView: UITableView, willPerformPreviewActionForMenuWith configuration: UIContextMenuConfiguration, animator: UIContextMenuInteractionCommitAnimating) {
        guard
            let identifier = configuration.identifier as? String,
            let index = Int(identifier)
        else {
            return
        }
        
        let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0))
        
        animator.addCompletion {
            self.performSegue(
                withIdentifier: Constants.Title.Marvel,
                sender: cell)
        }
    }
    
    override func tableView(_ tableView: UITableView, previewForHighlightingContextMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview? {
        return makeTargetedPreview(for: configuration)
    }
    
    override func tableView(_ tableView: UITableView, previewForDismissingContextMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview? {
        return makeTargetedPreview(for: configuration)
    }
    
    private func makeTargetedPreview(for configuration: UIContextMenuConfiguration) -> UITargetedPreview? {
        
        guard
            let identifier = configuration.identifier as? String,
            let index = Int(identifier),
            let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0)) as? CharacterTableViewCell
        else {
            return nil
        }
        
        return UITargetedPreview(view: cell.imgAvatar!)
    }
}
