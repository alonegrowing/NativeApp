//
//  Article.swift
//  Insight
//
//  Created by 徐勇 on 2020/12/29.
//

import Foundation

struct ArticleItem {
    var img: String
    var content: String
}

class Article {
    
   private var results = [ArticleItem]()
    
    //MARK: Initialization
    
    init?() {
        // Initialize stored properties.
        self.results = [
            ArticleItem(
                img: "https://wx2.sinaimg.cn/mw690/006kbplagy1glvjarp788j30n00n0ac1.jpg",
                content: "一个人若没有独立的人格，别人一个眼神，便可以把你关进心牢里，别让自己的灵魂，一辈子都在牢笼中渡过。"
            ),
            ArticleItem(
                img: "https://wx3.sinaimg.cn/mw690/006kbplagy1gkd1cq4kqcj30n00n0gnq.jpg",
                content: "成年人的告别仪式很简单，你没有回我消息，我也便默契的没有再发，就这样安静地消失在彼此的生活里，好像从没认识过一样。"
            )
        ]
    }
    
    func getArticle() -> [ArticleItem] {
        return self.results
    }
}
