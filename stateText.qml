import QtQuick 2.0

Rectangle {
    width: 360;
    height: 240;
    color: "#EEEEEE";
    id: rootItem;

    Text {
        id: centetText
        text: qsTr("A Single Text.")
        anchors.centerIn: parent;
        font.pixelSize: 24;
        //color: "red";

        MouseArea {
            id: mouseArea;
            anchors.fill: parent;
            hoverEnabled: true
            onReleased: {
                centetText.state = "redText";
            }
        }

        states: [
            State {
                name: "redText";
                changes: [
                    PropertyChanges{
                        target: centetText;
                        color: "red"
                    }
                ]
            },
            State {
                name: "blueText";
                when: mouseArea.pressed;
                PropertyChanges {
                    target: centetText;
                    color: "blue";
                    font.pixelSize: 36;
                }
            }

        ]
        state: "redText";

        Behavior on color {
            ColorAnimation {
                duration: 1000;
            }
        }

        Behavior on font.pixelSize {
            NumberAnimation {
                duration: 1000;
            }
        }

        /*transitions: [
            Transition {
                //from: "redText";
                //to: "blueText";
                ColorAnimation {
                    property: "color";
                    duration: 1000;
                }
                NumberAnimation {
                    property: "font.pixelSize";
                    duration: 1000;
                }
            },
            Transition {
                from: "blueText";
                to: "redText";
                ColorAnimation {
                    property: "color";
                    duration: 500;
                }
                NumberAnimation {
                    property: "font.pixelSize";
                    duration: 500;
                }
            }

        ]*/

    }
}
