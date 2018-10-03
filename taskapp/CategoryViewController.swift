//
//  CategoryViewController.swift
//  taskapp
//
//  Created by 高坂将大 on 2018/09/25.
//  Copyright © 2018年 shota.kohsaka. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{
    
    @IBOutlet weak var pickerView: UIPickerView!
    let realm = try! Realm()
    @IBOutlet weak var categoryAddText: UITextField!
    var categoryArray = try! Realm().objects(Category.self)
    var task : Task!
    let sc = UIScrollView();
    var txtActiveField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Pickerでの表示
        pickerView.delegate = self
        pickerView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        print(categoryArray)
        super.viewWillDisappear(animated)
    }
    
    //カテゴリー追加のアクション
    @IBAction func AddCategory(_ sender: Any) {
        if categoryAddText.text != ""{
            try! realm.write {
                let category = Category()
                let allCategorys = realm.objects(Category.self)
                if allCategorys.count != 0 {
                    category.id = allCategorys.max(ofProperty: "id")! + 1
                }
                category.categoryName = categoryAddText.text!
                self.realm.add(category, update: true)
                categoryAddText.text = ""
                print("categoryが追加されました")
                pickerView.reloadAllComponents()
            }
        }else{
            print("categoryText.textが空です")
        }
    }
    //カテゴリー削除のアクション
    @IBAction func DeleteCategory(_ sender: Any) {
        // データベースから削除する
        try! realm.write {
        self.realm.delete(self.categoryArray[pickerView.selectedRow(inComponent: 0)])
        pickerView.reloadAllComponents()
        }
    }
    
    //pickerView作成
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoryArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoryArray[row].categoryName
    }
}
