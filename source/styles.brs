function getClassesFromJson () as object
      info = ReadAsciiFile("pkg:/source/styles.json")
      json = ParseJson(info)

      'contentNode = CreateObject("roSGNode", "ContentNode")

      classes= CreateObject("roAssociativeArray")

      for each style in json
          for each item in json[style]
                classes[style] = item
          end for
          print classes.style[video]
      end for
      return classes
end function

'
' sub AddStyle (classes, style)
'       classes.style =
'
'
' end sub
