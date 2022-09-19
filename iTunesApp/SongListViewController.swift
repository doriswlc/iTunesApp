//
//  ViewController.swift
//  MemeApp
//
//  Created by doriswlc on 2022/9/12.
//

import UIKit
import Kingfisher

class SongListViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        songList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath) as! SongTableViewCell
        let song = songList[indexPath.row]
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy/MM/dd"
        cell.releaseDateLabel.text = dateFormatter.string(from: song.releaseDate)
        cell.artistNameLabel.text = song.artistName
        cell.trackNameLabel.text = song.trackName
        cell.artworkImageView.kf.setImage(with: song.artworkUrl100)
        return cell
    }
    var songList: [StoreItem] = []

    @IBOutlet weak var songTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songTableView.dataSource = self
        // Do any additional setup after loading the view.
        
        songTableView.rowHeight = 100
        songTableView.estimatedRowHeight = 0
    }
    
    func fetchItems(name: String) {
        if let urlString = "https://itunes.apple.com/search?term=\(name)&media=music&country=tw".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        decoder.dateDecodingStrategy = .iso8601
                        let searchResonse = try decoder.decode(SearchResponse.self, from: data)
                        DispatchQueue.main.async {
                            self.songList = searchResonse.results
                            self.songTableView.reloadData()
                        }
                    } catch {
                        print(error)
                    }
                } else {
                    print("Error")
                }
            }.resume()
        }
    }
    @IBSegueAction func showDetail(_ coder: NSCoder) -> DetailViewController? {
        let controller = DetailViewController(coder: coder)
        if let row = songTableView.indexPathForSelectedRow?.row {
            controller!.songSelected = songList[row]
            return controller
        } else { return nil }
    }
}

extension SongListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        fetchItems(name: searchBar.text ?? "")
        view.endEditing(true)
    }
}
