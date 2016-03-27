//
//  ViewController.swift
//  DRamirez_Shopping_List
//
//  Created by Daniel Ramirez on 2/9/16.
//  Copyright © 2016 DePaul University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var shoppingList: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // view AKA label
    @IBOutlet weak var listItems: UITextView!
    
    /* -------------text fields--------------------- */
    @IBOutlet weak var itemDescription: UITextField!

    @IBOutlet weak var itemQuantity: UITextField!
    
    @IBAction func itemDescriptionEnd(sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func itemQuantityEnd(sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBOutlet var testFields: [UITextField]!
    
    
    @IBAction func backgroundTouched(sender: UIControl) {
        for tf in testFields {
            tf.resignFirstResponder()
        }
        itemQuantity.resignFirstResponder()
    }
    
    
    /* --------------- buttons -------------------*/
    @IBAction func newListBtn(sender: AnyObject) {
        
        shoppingList.removeAll()
        listItems.text = ""
    }

    @IBAction func newItemBtn(sender: AnyObject) {
        
        itemDescription.text = ""
        itemQuantity.text = ""
    }
    
    @IBAction func addItemToListBtn(sender: AnyObject) {
        let qt:Int? = Int(itemQuantity.text!)
        
        if itemDescription.text == "" && itemQuantity.text == "" {
            popup();
        }
        else if itemDescription.text == "" && qt == nil {
            dipopup();
        }
        else if itemDescription.text == ""{
            
            dpopup();
        }
        else if  itemQuantity.text == "" {
            qpopup();
        }
        else if qt == nil {
            qipopup();
        }
        else {
            listItems.text = ""
    
            let itemToAdd = itemQuantity.text! + "x " + itemDescription.text! + "\n"
        
            shoppingList.append(itemToAdd)
        
            for item in shoppingList {
                listItems.text.appendContentsOf(item)
            }
        }
    }
    
    /* ---------------------------------- error alerts -------------------------------- */
    func popup () {
        let title = "Error"
        let message = "Both Item Description & Item Quantity text fields are empty"
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        let invalidAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
        alertController.addAction(invalidAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    func dpopup () {
        let title = "Error"
        let message = "Item Description text field is empty"
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        let invalidAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
        alertController.addAction(invalidAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    func qpopup () {
        let title = "Error"
        let message = "Item Quantity text field is empty"
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        let invalidAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
        alertController.addAction(invalidAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    func qipopup () {
        let title = "Error"
        let message = "Invalid input for Item Quantity (only numbers allowed)"
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        let invalidAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
        alertController.addAction(invalidAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    func dipopup () {
        let title = "Error"
        let message = "Item Description text field is empty & Invalid input for Item Quantity (only numbers allowed)"
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        let invalidAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
        alertController.addAction(invalidAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
}

