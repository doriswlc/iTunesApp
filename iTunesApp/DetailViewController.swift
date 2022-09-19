//
//  DetailViewController.swift
//  iTunesApp
//
//  Created by doriswlc on 2022/9/16.
//

import UIKit
import AVFoundation

class DetailViewController: UIViewController {
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var collectionNameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    var songSelected: StoreItem?
    var player: AVPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let url = songSelected?.previewUrl {
            player = AVPlayer(url: url)
            player?.play()
        }
        coverImageView.kf.setImage(with: songSelected?.artworkUrl100)
        artistNameLabel.text = songSelected?.artistName
        trackNameLabel.text = songSelected?.trackName
        collectionNameLabel.text = songSelected?.collectionName
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        if let date = songSelected?.releaseDate {
            releaseDateLabel.text = dateFormatter.string(from: date)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
