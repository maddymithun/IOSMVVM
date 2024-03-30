//
//  ProductViewController.swift
//  MVVMProject
//
//  Created by Mithun Chandra Dey on 3/27/24.
//

import UIKit

class ProductListViewController: UIViewController {
    private var productViewModel=ProductViewModel()
    
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var tableProductList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configuration()
        tableProductList.dataSource=self
  
    }
    
    @IBAction func btnAddButton(_ sender: Any) {
        let product = AddProduct(title: "iPhone")
        productViewModel.addProduct(parameters: product)
        
    }
    
}
extension ProductListViewController{
    func configuration(){
        tableProductList.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductTableViewCell")
        initViewModel()
        observeEvent()
    }
    func initViewModel(){
        productViewModel.fetchProduct()
    }
    // this is the communication medium.databinding event
    func observeEvent(){
        productViewModel.eventHnalder = { [weak self]event in
            guard let self else {
                return
            }
            switch event{
            case .loading: break
            case .stopLoading:break
            case .dateLoaded:
                print (self.productViewModel.products)
                DispatchQueue.main.async{
                    self.tableProductList.reloadData()
                }
                break
            case .error(let error):
                print(error)
                break
            case .newProductAdd(let newProduct):
                print(newProduct)
            }
            
        }
    }
}


extension ProductListViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell") as?
                ProductTableViewCell else {
            return UITableViewCell()
        }
        let product = productViewModel.products[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
       return productViewModel.products.count
        
    }
}
