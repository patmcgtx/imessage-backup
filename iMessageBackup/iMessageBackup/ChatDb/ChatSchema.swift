//
//  ChatSchema.swift
//  iMessageBackup
//
//  Created by Patrick McGonigle on 5/1/22.
//

import SQLite

/// Provides an SQLite instance of a table
protocol SQLiteTable {
    var table: Table { get }
}

/// The schema for the chat database
struct ChatSchema {
        
    struct ChatTable: SQLiteTable {
        var table: Table { Table("chat") }
        let idColumn = Expression<Int>("ROWID")
        let chatIdentifierColumn = Expression<String>("chat_identifier")
    }

    struct MessageTable: SQLiteTable {
        var table: Table { Table("message") }
        let idColumn = Expression<Int>("ROWID")
        let textColumn = Expression<String>("text")
    }
    
}
