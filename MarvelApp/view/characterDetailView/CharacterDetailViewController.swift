//
//  CharacterDetailViewController.swift
//  MarvelApp
//
//  Created by KasimOzdemir on 9.10.2021.
//

import UIKit
import Combine

class CharacterDetailViewController: UIViewController {
    var viewModel: CharacterDetailViewModel?
    
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var comicsCollectionView: UICollectionView!
    
    private var cancellables: Set<AnyCancellable> = []
    
    private var comics : [CharacterComic] = []
    
    private var idComicCollectionViewCell = "ComicCollectionViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.comicsCollectionView.register(UINib(nibName: idComicCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: idComicCollectionViewCell)
        self.setViewModel()
    }
    
    func setViewModel(){
        self.viewModel?.$character.sink{ character in
            self.lblName.text = character?.name
            self.lblDescription.text = character?.description
            let imageUrl = "\(character?.thumbnail?.path ?? "").\(character?.thumbnail?.extension_ ?? "")"
            self.imgAvatar.sd_setImage(with: URL(string: imageUrl), placeholderImage: nil, context: nil)
            self.viewModel?.requestFetchComics(characterId: character?.id ?? 0)
        }.store(in: &cancellables)
        
        self.viewModel?.$comics.sink{ comics in
            DispatchQueue.main.async {
                self.comics = (comics ?? []).sorted(by: { $0.issueNumber! < $1.issueNumber! })
                self.comicsCollectionView.reloadData()
            }
        }.store(in: &cancellables)
        
        self.viewModel?.$error.sink{ value in
            self.alertError(message: value?.localizedDescription, completion: nil)
        }.store(in: &cancellables)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel?.viewDidDisappear()
    }
    
    deinit {
        print("deinit CharacterDetailViewController")
    }

}

extension CharacterDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.comics.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // Set the data for each cell (color and color name)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idComicCollectionViewCell, for: indexPath) as? ComicCollectionViewCell {
            let title = self.comics[indexPath.row].title ?? ""
            let imageUrl = "\(self.comics[indexPath.row].thumbnail?.path ?? "").\(self.comics[indexPath.row].thumbnail?.extension_ ?? "")"
            cell.setComicCell(title: title, imageUrl: imageUrl)
            return cell
        }
        return UICollectionViewCell()
    }
    
    // Add spaces at the beginning and the end of the collection view
    /*func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
     return UIEdgeInsets(top: 0, left: 8, bottom: 8, right: 0)
     }*/
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 90.0, height: 250.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     
    }
    
    
}
