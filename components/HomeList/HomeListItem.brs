sub init()
    m.itemposter = m.top.findNode("itemPoster")
    m.itemlabel = m.top.findNode("itemLabel")
    m.top.observeField("itemContent", "showItemDataChanged")

end sub


sub showItemDataChanged()
  itemData = m.top.itemContent
  m.itemposter.uri = itemData.poster
  m.itemlabel.text = itemData.title

end sub
