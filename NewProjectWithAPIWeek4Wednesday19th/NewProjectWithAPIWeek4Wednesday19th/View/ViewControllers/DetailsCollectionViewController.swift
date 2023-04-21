//
//  DetailsCollectionViewController.swift
//  NewProjectWithAPIWeek4Wednesday19th
//
//  Created by Payam Karbassi on 19/04/2023.
//

import UIKit

class DetailsCollectionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var item : Product?
    let imageViewModel = ImageViewModel(anyImageManager: ImageNetworkManger())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
}

extension DetailsCollectionViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item?.images.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCollectionViewCell", for: indexPath) as! DetailCollectionViewCell
        
        guard let imageUrl = item?.images[indexPath.row] else { return cell }
        imageViewModel.getImage(withUrl: imageUrl) { image in
            DispatchQueue.main.async {
                cell.imageview.layer.cornerRadius = 10
                cell.imageview.image = image
            }
        }
        return cell
    }
}

extension DetailsCollectionViewController : UICollectionViewDelegate {
    
}
