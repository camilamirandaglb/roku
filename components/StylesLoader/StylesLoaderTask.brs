sub init()
    m.top.functionName="getStylesParsed"
end sub

sub getStylesParsed()
  info = ReadAsciiFile("pkg:/source/styles.json")
  json = ParseJson(info)

  styles = getStylesFromJson(json)

  LoadStyles(styles)
end sub


function getStylesFromJson (json as object) as object
      styles = CreateObject("roAssociativeArray")
      for each selector in json
          style = CreateObject("roAssociativeArray")
          style = json[selector]

          styles[selector] = style
      end for
      return styles
end function
