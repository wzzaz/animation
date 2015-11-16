import QtQuick 2.0

Rectangle {
    width: 360;
    height: 240;
    color: "#EEEEEE";
    id: rootItem;

    Rectangle {
        id: blueRect;
        width: 200;
        height: 200;
        color: "blue";
        x: 8;
        y: 8;
    }

    Rectangle {
        id: redRect;
        color: "red";
        width: 100;
        height: 100;
        anchors.left: blueRect.right;
        anchors.top: blueRect.top;
        anchors.leftMargin: 8;

        MouseArea {
            id: mouseArea;
            anchors.fill: parent;
            onClicked: {
                if(redRect.state == "" || redRect.state == "default"){
                    redRect.state = "reanchor";
                }else{
                    redRect.state = "default";
                }
            }
        }

        states: [
            State {
                name: "reanchor";
                AnchorChanges {
                    target: redRect;
                    //restoreEntryValues: false;
                    //explicit: true;
                    anchors.top: blueRect.bottom;
                    anchors.left: rootItem.left;
                }
                PropertyChanges {
                    target: redRect;
                    height: 40;
                    anchors.topMargin: 4;
                }
            },
            State {
                name: "default";
                AnchorChanges {
                    target: redRect;
                    anchors.left: blueRect.right;
                    anchors.top: blueRect.top;
                }
            }

        ]


    }
}
