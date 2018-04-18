//
//  ViewController.swift
//  CollectionViewAndAutoLayout
//
//  Created by Ricardo V Del Frari on 18/04/2018.
//  Copyright © 2018 Ricardo V Del Frari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var collectionView: UICollectionView!

    //An array with 10 elements to be used as a collection of itens
    var itensForCollection = Array(repeating: "Item", count: 10)
    
    //Keep track of the buttons that have been selected
    var selectedMusicButton: UIButton? {
        didSet(oldValue) {
            updateMusicButton(oldValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Touch Button Action
    @IBAction func touchUpButton(_ sender: UIButton) {
        print("Button \(sender.tag)")
        sender.isSelected = !sender.isSelected
        selectedMusicButton = sender.isSelected ? sender : nil
        
    }
    
    func updateMusicButton(_ oldButton: UIButton?) {
        if oldButton != nil {
            oldButton?.isSelected = false
        }
    }
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: UICollectionView Delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itensForCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIdentifier", for: indexPath)
        
        cell.layer.cornerRadius = 10
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //On devices like SE and 5S - Make the cell bigger. 300 is 45% of the size of iPhone SE screen
        if collectionView.bounds.size.height < 300 {
            return CGSize(width: collectionView.bounds.size.height/1.1, height: collectionView.bounds.size.height/1.1)
        }else {
            return CGSize(width: collectionView.bounds.size.height/2.1, height: collectionView.bounds.size.height/2.1)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if collectionView.bounds.size.height < 300 {
            return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        }else {
            return UIEdgeInsets(top: 8, left: 16, bottom: 0, right: 16)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
}

