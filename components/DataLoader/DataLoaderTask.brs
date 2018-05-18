sub init()
  m.top.functionName="loadData"
end sub

sub loadData()
    info = ReadAsciiFile("pkg:/source/api.json")
    json = ParseJson(info)

    contentNode = CreateObject("roSGNode", "ContentNode")

    for each category in json
            node = contentNode.CreateChild("ContentNode")
            node.title = json[category].title
            for each video in json[category].items
                createVideoItemData(video,node)
            end for
    end for

    m.top.data= contentNode

end sub

sub createVideoItemData(video, node)
    item = node.CreateChild("HomeListItemData")
    item.category = node.category
    item.title = video.title
    item.poster = video.image
    item.description = video.description
    item.video = video.video
end sub
