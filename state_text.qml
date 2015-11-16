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
        color: "red";

        PropertyAnimation {
            id: coloranimation;
            target: centetText;
            property: "color";
            to: "blue";
            duration: 1000;
        }

        PropertyAnimation {
            id: sizeanimation;
            target: centetText;
            property: "font.pixelSize";
            to: 36;
            duration: 1000;
        }

        PropertyAnimation {
            id: returncolor;
            target: centetText;
            property: "color";
            to: "red";
            duration: 1000;
        }
        PropertyAnimation {
            id: returnsize
            target: centetText;
            property: "font.pixelSize";
            to: 24;
            duration: 1000;
        }

        MouseArea {
            anchors.fill: parent;
            hoverEnabled: true
            onPressed: {
                coloranimation.start();
                sizeanimation.start();
            }
            onReleased: {
                returnsize.start();
                returncolor.start();
            }
        }
    }
}
