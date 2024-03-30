//
//  ProductTableViewCell.swift
//  MVVMProject
//
//  Created by Mithun Chandra Dey on 3/27/24.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productBackgroundView: UIView!
    
    var product:Product?{
        didSet{ // this is call property observer . when initilize product from controller auto call didset .
           productDetailsConfiguration()
        }
    }
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var productRating: UILabel!
    
    @IBOutlet weak var btnRating: UIButton!
    
  
    
    @IBOutlet weak var pricelabel: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func btnBuy(_ sender: Any) {
    }
    func productDetailsConfiguration(){
        guard let product else{
            return
        }
        productTitle.text=product.title
        productRating.text=product.category
        btnRating.setTitle("\(product.rating?.rate)", for: .normal)
        productDescription.text=product.description
        pricelabel.text="$\(product.price)"
        
    }
}
