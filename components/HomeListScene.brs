sub init()
    m.homeRowList = m.top.findNode("homeList")
    m.dataloaderTask = CreateObject("roSGNode", "DataLoaderTask") 'task thread'
    m.dataloaderTask.observeField("data", "onchangedDataLoad")
    m.dataloaderTask.control= "RUN"
    showCategories()
end sub

function onchangedDataLoad() as void
    if m.dataloaderTask.data <> invalid
        print "changed!"
        showCategories()
    end if
end function

sub showCategories()
  m.values = m.dataloaderTask.data

  content = CreateObject("roSGNode", "ContentNode")

  'row for drama movies'
  drama_row = content.CreateChild("ContentNode")
  drama_row.title = m.values.["Drama"].title

  for each item in m.values.["Drama"].items
    node = content.CreateChild("ContentNode")
    createVideoItemData(item, node)
  end for
  'row for horror movies'
  horror_row = content.CreateChild("ContentNode")
  horror_row.title = m.values.["Horror"].title

  for each item in m.values.["Horror"].title
     node = content.CreateChild("ContentNode")
     createVideoItemData(item, node)
  end for
  'row for action movies'
  action_row = content.CreateChild("ContentNode")
  action_row.title = m.values.["Action"].title
  for each item in m.values.["Action"].title
    node = content.CreateChild("ContentNode")
    createVideoItemData(item, node)
  end for

  m.rowlist.SetFocus(true)
  m.rowlist.content = content
end sub

sub createVideoItemData (item , node)
    video= node.CreateChild("HomeListData")
    video.title = item.title
    video.image= item.image
end sub
