sub init()
    m.group = m.top.findNode("HomeListLayoutGroup")
    m.itemposter = m.top.findNode("itemPoster")
    m.itemlabel = m.top.findNode("itemLabel")
    m.top.observeField("itemContent", "showItemDataChanged")

    styles = GetStyles()
    m.group.setfields(styles.classes.homeListItemLayout)
    m.itemposter.setfields(styles.classes.homeListItemPoster)
    m.itemlabel.setfields(styles.classes.homeListItemLabel)
    
end sub


sub showItemDataChanged()
  itemData = m.top.itemContent
  m.itemposter.uri = itemData.poster
  m.itemlabel.text = itemData.title

end sub
