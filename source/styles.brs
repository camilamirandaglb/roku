function getClassesFromJson () as object
      info = ReadAsciiFile("pkg:/source/styles.json")
      json = ParseJson(info)

      'contentNode = CreateObject("roSGNode", "ContentNode")

      classes= CreateObject("roAssociativeArray")

      for each selector in json
          style = CreateObject("roAssociativeArray")
          style = json[selector]
          ' for each item in json[selector]
          classes[selector] = style

      end for
      return classes
end function
