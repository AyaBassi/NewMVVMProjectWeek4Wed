//
//  ViewController.swift
//  NewProjectWithAPIWeek4Wednesday19th
//
//  Created by Payam Karbassi on 19/04/2023.
//

import UIKit


class ItemTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var item : Item?
    
    let itemTableViewViewModel = ItemTableViewControllerViewModel(anyManager: NetworkManager())
    
    let imageViewModel = ImageViewModel(anyImageManager: ImageNetworkManger())
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        

        itemTableViewViewModel.getAllDetailsWithClosure(withUrl: "https://dummyjson.com/products") {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}


extension ItemTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemTableViewViewModel.item?.products.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else {return UITableViewCell() }
        let product = itemTableViewViewModel.item?.products[indexPath.row]
        cell.title.text = product?.title
        cell.brand.text = product?.brand
        cell.price.text = "£\(product?.price ?? 0)"
        cell.imageview.layer.cornerRadius = 10
        guard let url = product?.thumbnail else {return cell}
        imageViewModel.getImage(withUrl: url) { image in
            DispatchQueue.main.async {
                cell.imageview.image = image
            }
        }
        return cell
    }
}

extension ItemTableViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailsCollectionViewController") as! DetailsCollectionViewController
        vc.item = itemTableViewViewModel.item?.products[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
