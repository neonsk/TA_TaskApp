//
//  task.swift
//  taskapp
//
//  Created by 高坂将大 on 2018/09/20.
//  Copyright © 2018年 shota.kohsaka. All rights reserved.
//

import RealmSwift

class Task: Object {
    // 管理用 ID。プライマリーキー
    @objc dynamic var id = 0
    
    // タイトル
    @objc dynamic var title = ""
    
    // 内容
    @objc dynamic var contents = ""
    
    /// 日時
    @objc dynamic var date = Date()
    
    // カテゴリー追加
    @objc dynamic var category = ""
    
    // 登録済みカテゴリー追加
    @objc dynamic var categoryMaking = ""
    
    /**
     id をプライマリーキーとして設定
     */
    override static func primaryKey() -> String? {
        return "id"
    }
}
