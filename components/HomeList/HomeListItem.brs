sub init()
  print "init of home list item"
    m.itemposter = m.top.findNode("itemPoster")
    m.itemlabel = m.top.findNode("itemLabel")
    'm row label'
end sub

sub showItemDataChanged()
  print "showItemDataChanged"
  itemData = m.itemContent
  m.itemposter.uri = itemData.image
  m.itemlabel.text = itemData.title
end sub
