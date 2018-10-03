//
//  category.swift
//  taskapp
//
//  Created by 高坂将大 on 2018/09/25.
//  Copyright © 2018年 shota.kohsaka. All rights reserved.
//

import RealmSwift

class Category: Object {
    // 管理用 ID。プライマリーキー
    @objc dynamic var id = 0
    
    // カテゴリー追加
    @objc dynamic var categoryName = ""
    
    /**
     id をプライマリーキーとして設定
     */
    override static func primaryKey() -> String? {
        return "id"
    }
}

