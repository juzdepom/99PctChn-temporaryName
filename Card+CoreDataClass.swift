//
//  Card+CoreDataClass.swift
//  99PctChn
//
//  Created by Julia Miller on 11/15/16.
//  Copyright © 2016 Julia Miller. All rights reserved.
//

import Foundation
import CoreData
import UIKit


public class Card: NSManagedObject {
    
    var rank: Int {
        get { return Int(int32rank) }
        set { int32rank = Int32(newValue) }
    }
    
    var deck: Int {
        get { return Int(int32deck) }
        set { int32deck = Int32(newValue) }
    }
    
    convenience init(rank: Int, chinese: String, pinyin: String, translation: String, example: String?, exampleTranslation: String?, context: NSManagedObjectContext){
        let entity = NSEntityDescription.entity(forEntityName: "Card", in: context)!
        self.init(entity: entity, insertInto: context)
        self.rank = rank
        self.chinese = chinese
        self.pinyin = pinyin
        self.translation = translation
        self.example = example
        self.exampleTranslation = exampleTranslation
        self.flipped = false
        self.deck = 0
        self.lastReviewed = nil
        
    }
    
    func returnColor() -> UIColor {
        switch(self.deck) {
        case 0:
            return UIColor.white
        case 1:
        return UIColor.red
        case 2:
            return UIColor.yellow
        case 3:
            return UIColor.green
        default:
            print("Deck index: ", self.deck)
            return UIColor.gray
        }
        
    }

}
