sub init()
    m.homelist = m.top.FindNode("homeList")
    m.dataloader = CreateObject("roSGNode","DataLoaderTask")
    m.dataloader.observeField("data", "onChangeData")
    m.dataloader.control="RUN"
    m.homelist.rowFocusAnimationStyle = "floatingfocus"
    m.homelist.rowLabelOffset = [ [0, 20], [0, 20], [0, 20] ]
    m.homelist.showRowLabel = [true, true, true]
    m.homelist.rowItemSize = [ [536, 308], [536, 308], [536, 308] ]
    m.homelist.setfocus(true)

end sub

sub onChangeData()
  if m.dataloader.data <> invalid
    showCategories()
  end if
end sub

sub showCategories()
    m.homelist.content = m.dataloader.data
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
    if key = "OK"
      if m.homelist.visible = true
            playVideo()
            m.homelist.visible = false
        end if
      if m.Video.control="play" then
        m.Video.control="pause"
      else
        m.Video.control="resume"
      end if
    else if key = "back"
      if m.Video.visible then
        m.Video.visible = false
        m.homelist.visible = true
        m.homelist.setfocus(true)
        return true
      end if
      else
        return false
    end if
end function
