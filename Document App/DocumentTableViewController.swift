//
//  DocumentTableViewController.swift
//  Document App
//
//  Created by HUMBLOT Stéphane on 06/12/2023.
//

import UIKit
import QuickLook

struct DocumentFile {
    var title: String
    var size: Int
    var imageName: String? = nil
    var url: URL
    var type: String
    
    static var documents: [DocumentFile] = [
        DocumentFile(title: "Document 1", size: 100, imageName: nil, url: URL(string: "https://www.apple.com")!, type: "text/plain"),
        DocumentFile(title: "Document 2", size: 200, imageName: nil, url: URL(string: "https://www.apple.com")!, type: "text/plain"),
        DocumentFile(title: "Document 3", size: 300, imageName: nil, url: URL(string: "https://www.apple.com")!, type: "text/plain"),
        DocumentFile(title: "Document 4", size: 400, imageName: nil, url: URL(string: "https://www.apple.com")!, type: "text/plain"),
        DocumentFile(title: "Document 5", size: 500, imageName: nil, url: URL(string: "https://www.apple.com")!, type: "text/plain"),
        DocumentFile(title: "Document 6", size: 600, imageName: nil, url: URL(string: "https://www.apple.com")!, type: "text/plain"),
        DocumentFile(title: "Document 7", size: 700, imageName: nil, url: URL(string: "https://www.apple.com")!, type: "text/plain"),
        DocumentFile(title: "Document 8", size: 800, imageName: nil, url: URL(string: "https://www.apple.com")!, type: "text/plain"),
        DocumentFile(title: "Document 9", size: 900, imageName: nil, url: URL(string: "https://www.apple.com")!, type: "text/plain"),
        DocumentFile(title: "Document 10", size: 1000, imageName: nil, url: URL(string: "https://www.apple.com")!, type: "text/plain")
    ]
}

extension Int {
    func formattedSize() -> String {
        let bcf = ByteCountFormatter()
        bcf.allowedUnits = [.useKB, .useMB]
        bcf.isAdaptive = false
        bcf.countStyle = .file
        return bcf.string(fromByteCount: Int64(self))
    }
}

class DocumentTableViewController: UITableViewController, QLPreviewControllerDataSource {
    var selectedDocumentIndex: Int?
    let cellIdentifier = "DocumentCell"
    let rootFolder: String = Bundle.main.bundlePath + "/Assets/Images"
    
    var documents : [DocumentFile] = []
    
    func loadFiles() {
        let fm = FileManager()
        do {
            let filesName = try fm.contentsOfDirectory(atPath: rootFolder)
            filesName.forEach {
                let url = URL(fileURLWithPath: rootFolder + "/" + $0)
                do {
                    let values = try url.resourceValues(forKeys: [.typeIdentifierKey, .nameKey, .fileSizeKey])
                    documents.append(DocumentFile(title: values.name!, size: values.fileSize!, url: url, type: values.typeIdentifier!))
                } catch {
                    print("Couldn't load file \($0)")
                }
            }
        } catch {
            print("Couldn't find folder")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadFiles()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return documents.count
    }
    
    // Indique au Controller comment remplir la cellule avec les données
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel!.text = documents[indexPath.row].title
        cell.detailTextLabel!.text = documents[indexPath.row].size.formattedSize()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedDocumentIndex = indexPath.row
        showPreviewController()
    }
    
    func showPreviewController() {
        guard selectedDocumentIndex != nil else { return }
        
        let previewController = QLPreviewController()
        previewController.dataSource = self
        
        navigationController?.pushViewController(previewController, animated: true)
    }
    
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        guard let selectedDocumentIndex = selectedDocumentIndex else {
            fatalError("Selected document index is nil.")
        }
        
        let selectedDocument = documents[selectedDocumentIndex]
        
        return selectedDocument.url as QLPreviewItem
    }
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
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
    
}
