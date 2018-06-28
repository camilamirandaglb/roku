sub init()
    m.group = m.top.findNode("HomeListLayoutGroup")
    m.itemposter = m.top.findNode("itemPoster")
    m.itemlabel = m.top.findNode("itemLabel")
    m.top.observeField("itemContent", "showItemDataChanged")

    styles = RedokuGetState().styles.items
    m.group.setfields(styles.rowItemLayout)
    m.itemposter.setfields(styles.video_image)
    m.itemlabel.setfields(styles.rowItemLabel)
end sub


sub showItemDataChanged()
  itemData = m.top.itemContent
  m.itemposter.uri = itemData.poster
  m.itemlabel.text = itemData.title

end sub
