sub init()
    m.homelist = m.top.FindNode("homeList")
    m.dataloader = CreateObject("roSGNode","DataLoaderTask")
    m.dataloader.observeField("data", "onChangeData")
    m.dataloader.control="RUN"
end sub

sub onChangeData()
  print "onchangedata"
  print m.dataloader.data
  if m.dataloader.data <> invalid
    showCategories()
  end if
end sub

sub showCategories()
  print "show categories"
  ' ContentNode= CreateObject("roSGNode","ContentNode") 'nodo padre'
  '
  ' drama_row= contentNode.CreateChild("ContentNode") 'nodo hijo'
  ' drama_row.title = m.dataloader.data["drama"].title
  ' print drama_row.title
  ' for each video in m.dataloader.data["drama"].items
  '     createVideoItemData(video, drama_row)
  ' end for
  '
  ' horror_row = contentNode.CreateChild("ContentNode") 'nodo hijo'
  '
  ' for each video in m.dataloader.data["horror"].items
  '     createVideoItemData(video, horror_row)
  ' end for
  '
  ' action_row = contentNode.CreateChild("ContentNode") 'nodo hijo'
  '
  ' for each video in m.dataloader.data["action"].items
  '     createVideoItemData(video, action_row)
  ' end for
  ' m.homelist.content = contentNode
  ' m.homelist.SetFocus(true)

  contentNode = CreateObject("roSGNode", "ContentNode")

    dramaNode = contentNode.CreateChild("ContentNode")
    for each video in m.dataloader.data["drama"].items
            createVideoItemData(video, dramaNode)
    end for

    for each category in m.dataLoader.data
        if category <> "drama"
            node = contentNode.CreateChild("ContentNode")
            for each video in m.dataloader.data[category].items
                createVideoItemData(video,node)
            end for
        end if
    end for

    m.homelist.SetFocus(true)
    m.homelist.content = contentNode

end sub

sub createVideoItemData(video, node)
  print "createVideo"
    item = node.CreateChild("HomeListItemData")
    item.title = video.title
    item.poster = video.image
    item.description = video.description
    item.video = node.video
end sub

function playVideo() as void
 print "play video"
    m.Video = m.top.findNode("myVideo")
    m.Video.visible = false

    row = m.homelist.rowItemFocused[0]
    col = m.homelist.rowItemFocused[1]
    selectedContent = m.homelist.content.getChild(row).getChild(col)

    if selectedContent <> invalid
        Content = CreateObject("roSGNode", "ContentNode")
        Content.streamformat = "m3u8"
        Content.url = selectedContent.video
        Content.Description = selectedContent.description
        Content.Title = selectedContent.title

        m.Video.visible = true
        m.Video.content = Content
        m.Video.control = "play"
    end if
end function

function onKeyEvent(key as String, press as Boolean) as boolean
  print "onplay"
   if key = "OK"
        if m.homelist.visible = true
            playVideo()
            m.homelist.visible = false
        end if
    else if key = "play"
      if m.Video.control = "pause"
        m.Video.control = "resume"
      else
        m.Video.control = "pause"
      end if
    else if key = "back"
        m.Video.visible = false
        m.homelist.visible = true
        m.homelist.setfocus(true)
        return true
    end if

end function
