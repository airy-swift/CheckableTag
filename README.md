

<img src="https://user-images.githubusercontent.com/61507019/76700072-f664a380-66f6-11ea-83fc-ce0827cb5871.JPG" width="200">


[![Swift Version](https://img.shields.io/badge/Swift-5-F16D39.svg)](https://developer.apple.com/swift)
[![GitHub](https://img.shields.io/github/license/mashape/apistatus.svg)](https://github.com/airy-swift/CheckableTag)
[![Cocoapods](https://img.shields.io/cocoapods/v/CheckableTag.svg)](https://github.com/airy-swift/CheckableTag)

# CheckableTag
this provide simple tags easiliy.

# 概要
CollectionViewってめんどいじゃん？楽に使いたいじゃん？タグ作りたいじゃん？洒落た感じにしたいじゃん？

そんな君はCheckableTagを使おう！

- 何種類かのタグの形やスタイルをサポートしてます。
- 簡単に使えます。
- まぁ洒落てないことは無いです。(製作者主観評価)


# 導入
現在はPodfileのみ対応
```
pod 'CheckableTag'
```
and pod install or update...

# Usage
基本的な使い方は以下
```swift
import UIKit
import CheckableTag

class ViewController: UIViewController {
    
    let items = ["#Cat", "#Dog", "#Cute", "#Cool", "#Awesome", "#fluffy"]

    let tagView: CheckableTag = {
        let view = CheckableTag()
        view.cellType = .round
        view.cellStyle = .groove
        view.canSelect = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tagView.frame = self.view.bounds
        
        self.view.addSubview(tagView)
        
        tagView.dataSource = self
        
    }
}

extension ViewController: CheckableTagDataSource {
    func getSelected(sender: CheckableTag) -> [Bool]? {
        return [true, false, true, false, true, true]
    }
    
    func getItems(sender: CheckableTag) -> [String] {
        return items
    }
}
```

# 簡単な説明
- Podfileでインストールしてきたらまず``` import CheckableTag ```してね！
- CheckableTagが本体なのでそれを``` let tagView = CheckableTag() ```などしてインスタンス化しよう！
- 下記の簡単な定義達を見てタグの形やスタイルを決めてね！オススメは、```.curve, .groove ```だよ！
- frameだったりconstraintでCheckableTagのサイズを決めたらaddSubViewしちゃおう！
- dataSouceプロトコルに準拠して``` func getItems(sender: CheckableTag) -> [String] ```でタグを追加しよう！
- 実行するとタグが表示されるはずだよ！表示されなかったらissueとしてお知らせしてくれると嬉しいな！PRだと踊り狂っちゃうよ！

canSelectはデフォルトでtrueの、タップ可能にするか操作できるプロパティだよ！
falseにするとユーザーがタグをタップしても何も起こらなくなるんだ！

# 簡単な定義達や実際に使ってるコード
## Enums
CellTypeの定義
```swift
public enum CellType: String {
    ///完全に四角
    case square = "SquareCheckableCell"
    ///角が少しだけ丸まる
    case curve = "CurveCheckableCell"
    ///両サイドが丸くなる
    case round = "RoundCheckableCell"
    ///完全に丸。 
    case circle = "CircleCheckableCell"
}
```
CellStyleの定義
```swift
public enum CellStyle {
    ///ノーマルとしか言いようがない。
    case normal
    ///少しだけ内側に溝を作る。
    case groove
}
```

## DataSourceの使用例
```swift
tagView.dataSource = self

------------------------------

extension ViewController: CheckableTagDataSource {
    ///初期選択状態を指定できる。
    func getSelected(sender: CheckableTag) -> [Bool]? {
        return [true, false, true, false, true, true]
    }
    
    ///tagを生成するためにタグのテキストを伝えられる。
    func getItems(sender: CheckableTag) -> [String] {
        return items
    }
}
```
## Delegateの使用例
```swift
tagView.delegate = self

----------------------------

extension ViewController: CheckableTagDelegate {
    ///セルを選択したときの動作を設定できる。
    func didSelected(cell: CheckableCellProtocol) {
        print(cell.textLabel.text)
    }
}
```

## Animationの使用例
```swift
tagView.animation = self

----------------------------

extension ViewController: TouchCellAnimationProtocol {
    ///タップし始めのときに行われるアニメーション。
    func touchStartAnimation(cell: CheckableCellProtocol) {
        UIView.transition(with: cell, duration: 1.0, options: [.transitionFlipFromTop], animations: nil, completion: nil)
    }
    ///タップ終わりのときに行われるアニメーション。
    func touchEndAnimation(cell: CheckableCellProtocol) {
        UIView.transition(with: cell, duration: 1.0, options: [.transitionFlipFromBottom], animations: nil, completion: nil)
    }
}

```

# Author
airy-swift(ツイッター繋げるかも。)

# Lisence
this is under the MIT lisence.








