function GetStyles() as Object
    return {
        classes: {
            ' HomeScene
            homeList: {
                    translation : "[ 130, 170 ]",
                    basePosterSize:"[ 512, 288 ]",
                    vertFocusAnimationStyle:"fixedFocusWrap",
                    itemSpacing:"[10, 10]",
                    columnSpacings:"[10,10]",
                    numColumns:"3"
            },
            video: {
                   width:"1920",
                   height:"1080",
                   visible:false
            },

            videoDetail:{
                visible: false
            },

            'Home List item
            homeListItemLayout: {
                  layoutDirection: "vert",
                  vertAlignment:"top",
                  translation:"[0, 0]"
            },

            homeListItemPoster: {
                  width:"500",
                  height: "290"
            },

            homeListItemLabel: {
                   height: "60",
                   width: "0",
                   horizAlign: "left",
                   vertAlign: "center",
                   translation: "[318,8]"
            },

            'Video detail scene

            videoDetailLeftLayoutGroup:{
                translation:"[450,300]"
            },

            videoDetailPoster: {
                width:"500",
                height: "290"
            },

            labelList: {
                 vertFocusAnimationStyle:"fixedFocusWrap"
            },

            videoDetailRightLayoutGroup:{
                  vertAlignment:"top",
                  horizAlignment:"left",
                  translation:"[1000,300]"
            },

            videoDescription:{
                  width:"630",
                  wrap:true
            }

        }
    }
end function
