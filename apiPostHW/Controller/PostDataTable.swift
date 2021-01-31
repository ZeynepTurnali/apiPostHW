//
//  PostDataTable.swift
//  apiPostHW

import UIKit
import Alamofire

class PostDataTable: UITableViewController {

    var postArray: Posts? = []
    var status = false
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 100
        
        getData()
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return postArray!.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath)

        let item = postArray![indexPath.row]
        cell.textLabel?.text = "Title: \(item.title)"
        cell.textLabel?.numberOfLines = 2
        cell.detailTextLabel?.text = "Row: \(item.id)"
        
        return cell
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = postArray?[indexPath.row]
        index = indexPath.row
        performSegue(withIdentifier: "detail", sender: item);
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "detail") {
            let vc = segue.destination as! Detail
            vc.postsDetail = self.postArray!
            vc.numberOfRow = self.index
        }
    }
    
    func getData(){
        let endpoint = URL(string: "https://jsonplaceholder.typicode.com/posts")!

        let request = AF.request(endpoint, method: .get).validate()
        request.responseJSON { (data) in
           // print(data)

            if(data.response?.statusCode == 200){
                self.postArray = try? JSONDecoder().decode(Posts.self, from: data.data!)
                    self.tableView.reloadData()
            }
        }
    }

}
