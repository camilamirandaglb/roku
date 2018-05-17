function init() as void
  m.poster = m.top.findNode("itemImage")
  m.itemlabel = m.top.findNode("itemLabel")
end function

function itemContentChanged() as void
  itemdata = m.itemContent
  m.poster.uri = itemdata.poster
  m.label.text = itemdata.title
end function
