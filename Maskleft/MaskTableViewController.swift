//
//  MaskTableViewController.swift
//  Maskleft
//
//  Created by Chang Sophia on 2/15/20.
//  Copyright © 2020 Chang Sophia. All rights reserved.
//

import UIKit

class MaskTableViewController: UITableViewController {

    var name: [String] = []
        var id: [String] = []
        var pharmacyName: [String] = []
        var tel: [String] = []
        var adultCount: [String] = []
        var childCount: [String] = []
        
    

        override func viewDidLoad() {
            super.viewDidLoad()
    
           let urlStr = "https://quality.data.gov.tw/dq_download_json.php?nid=116285&md5_url=2150b333756e64325bdbc4a5fd45fad1".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    let url = URL(string: urlStr!)
                    
                    let task = URLSession.shared.dataTask(with: url!) { (data, respose, error) in
                        if let data = data, let masks = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [[String: Any]] {
                           
                            DispatchQueue.main.async{
                                
                                for mask in masks {
                                    self.id.append(mask["id"] as! String)
                                }
                                for mask in masks {
                                    self.pharmacyName.append(mask["pharmacyName"] as! String)
                                }
                                for mask in masks {
                                    self.tel.append(mask["telTime"] as! String)
                                }
                                for mask in masks {
                                    self.adultCount.append(mask["adultCount"] as! String)
                                }
                                for mask in masks {
                                   self.childCount.append(mask["childCount"] as! String)
                                    }
                                }
                                print(self.id)
                                self.tableView.reloadData()
                        
                    }
                }
               task.resume()
             }
 
            override func didReceiveMemoryWarning() {
                   super.didReceiveMemoryWarning()
                   // Dispose of any resources that can be recreated.
               }
                
                
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                    let detailController = segue.destination as? DetailTableViewController
                if let row = tableView.indexPathForSelectedRow? .row {
                    let mask: [Any] = [id[row], pharmacyName[row], tel[row], adultCount[row], childCount[row]]
                        
                        detailController?.mask = mask
                    }
            }
                func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
                    let pharmacyName = self.pharmacyName[indexPath.row]
                    let tel = self.tel[indexPath.row]
                    cell.textLabel?.text = pharmacyName
                    cell.detailTextLabel?.text = tel
                }

                override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)-> UITableViewCell
                {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "MaskCell", for: indexPath)
                    
                    configure(cell: cell, forItemAt: indexPath)
                    return cell
                }

                override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)-> Int {
                    return pharmacyName.count
            }
            
}
