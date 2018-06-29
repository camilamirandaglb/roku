sub init()
  m.top.functionName="getDataParsed"
end sub

sub getDataParsed()
    info = ReadAsciiFile("pkg:/source/api.json")
    json = ParseJson(info)


    movies = getMoviesFromJson(json)

    AddMovies(movies)
    print movies

end sub

function getMoviesFromJson (json as object) as object
      contentNode = CreateObject("roSGNode", "ContentNode")
      for each category in json
                node = contentNode.CreateChild("ContentNode")
                node.title = json[category].title
                for each video in json[category].items
                    item = node.CreateChild("ContentNode")
                    item.category = node.category
                    item.title = video.title
                    item.poster = video.image
                    item.description = video.description
                    item.video = video.video
                end for
                contentNode.appendChild(node)
        end for
        return contentNode
end function
