//
//  TableViewModel.swift
//  GenericTableView
//
//  Created by saish chachad on 18/05/19.
//  Copyright © 2019 Heady. All rights reserved.
//

import Foundation

typealias UserDataSource = TableCellConfigurator<UserCell, User>
typealias MessageDataSource = TableCellConfigurator<MessageCell, Message>
typealias ImageDataSource = TableCellConfigurator<ImageCell,Image>

class TableViewModel {
    let items: [CellConfigurator] = [
        UserDataSource.init(item: User(name: "Shaurya", description: "1yr", image: "shaurya")),
        MessageDataSource.init(item: Message(text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")),
        ImageDataSource.init(item: Image(name: "big")),
    ]
}
