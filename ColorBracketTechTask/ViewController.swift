//
//  ViewController.swift
//  ColorBracketTechTask
//
//  Created by Digvijay Nikam on 17/01/23.
//

import UIKit

// MARK : Use SDWebImage Pod
import SDWebImage

class ViewController: UIViewController {
    @IBOutlet weak var cartTableView: UITableView!
    var api = [DataClass]()
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        dataAnddelegate()
        dataFetchFromApi()
    }
    
// MARK : Use Register Nib
    
    func registerNib(){
        let uinib = UINib(nibName: "CartTableViewCell", bundle: nil)
        cartTableView.register(uinib, forCellReuseIdentifier: "CartTableViewCell")
    }
    
// MARK : Use To Delegate DataSource And Delegate
    
    func dataAnddelegate(){
        cartTableView.dataSource = self
        cartTableView.delegate = self
    }
    func dataFetchFromApi(){
        let urlString = "https://www.minisokw.com/rest/V3/inosolnapiV1/productdetails/947/0?lang=e"
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        var session = URLSession(configuration: .default)
        var dataTask = session.dataTask(with: request) {data, responce, error in
            print(error)
            let getJSONObject = try! JSONSerialization.jsonObject(with: data!) as! [[String:Any]]
      
            for dictionary in getJSONObject{
                let eachdictionary = dictionary as! [String : Any]
                
                let dataFromDict = eachdictionary["data"] as! [String : Any]
                
                let id = dataFromDict["id"] as! String
                let image = dataFromDict["image"] as! String
                let sku = dataFromDict["sku"] as! String
                let desc = dataFromDict["description"] as! String
                
                self.api.append(DataClass(id: id, image: image, sku: sku, description: desc))
            }
            DispatchQueue.main.async {
            self.cartTableView.reloadData()
            }
        }
        dataTask.resume()
    }
}

// MARK : use extention for UITableViewDataSource

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return api.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.cartTableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as! CartTableViewCell
        cell.idLabel.text = api[indexPath.row].id
        cell.descriptionButton.text = api[indexPath.row].sku
        cell.colorNamelabel.text = api[indexPath.row].description
        
        let imageFetched = NSURL(string: api[indexPath.row].image)
        cell.productImageView.sd_setImage(with: imageFetched as! URL)
        
        return cell
    }
}

// MARK : use extention for UITableViewDelegate

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 896
    }
}
