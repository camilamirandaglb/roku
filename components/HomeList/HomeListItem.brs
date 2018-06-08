sub init()
    m.group = m.top.findNode("HomeListLayoutGroup")
    m.itemposter = m.top.findNode("itemPoster")
    m.itemlabel = m.top.findNode("itemLabel")
    m.top.observeField("itemContent", "showItemDataChanged")

    styles = getClassesFromJson()
    m.group.setfields(styles.itemLayout)
    m.itemposter.setfields(styles.image)
    m.itemlabel.setfields(styles.itemLabel)

end sub


sub showItemDataChanged()
  itemData = m.top.itemContent
  m.itemposter.uri = itemData.poster
  m.itemlabel.text = itemData.title

end sub
