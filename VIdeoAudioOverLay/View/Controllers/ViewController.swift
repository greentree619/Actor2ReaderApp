//
//  ViewController.swift
//  VIdeoAudioOverLay
//
//  Created by Jatin Kathrotiya on 06/09/22.
//

import UIKit

class ViewController: UIViewController {
    var videoPicker: VideoPicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        videoPicker = VideoPicker(presentationController: self, delegate: self)
    }
    
    // MARK: ---- Action Events ---
    @IBAction func btnUploadClicked(_ btn: UIButton) {
        videoPicker?.present()
    }
}

extension ViewController: VideoPickerDelegate {
    func didSelect(url: URL?) {
        guard let vc: VideoRecordViewController = UIStoryboard.mainStoryboard?.instantiateVC(),
              let url = url else {
            return
        }
        vc.uploadVideourl = url
        self.show(vc, sender: nil)
    }
}
