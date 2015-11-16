import QtQuick 2.3

Rectangle {
    width: 360;
    height: 240;
    color: "#EEEEEE";
    id: rootItem;

    Text {
        id: centerText;
        text: "A Sing Text.";
        anchors.centerIn: parent;
        font.pixelSize: 24;

        MouseArea {
            id: mouseArea;
            anchors.fill: parent;
            onReleased: {
                centerText.state = "redText";
            }
        }

        states: [
            State {
                name: "redText";
                changes:[
                    PropertyChanges{ target: centerText; color: "red"; }
                ]
            },
            State {
                name: "buleText";
                when: mouseArea.pressed;
                PropertyChanges{ target: centerText; color: "blue";
                                 font.bold: true; font.pixelSize: 32; }
            }
        ]

        state: "blueText";
    }
}
