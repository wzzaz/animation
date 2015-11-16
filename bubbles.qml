import QtQuick 2.0

Rectangle {
    width: 360;
    height: 420;
    color: "#E0E0E0";
    id: root;
    focus: true;
    Row {
        id: bubbles;
        anchors.top: parent.top;
        anchors.horizontalCenter: parent.horizontalCenter;
        spacing: 2;
        property var diedCount: 0;
        Component.onCompleted: {
            var i = 0;
            var qmlStringBegin = "import QtQuick 2.2; Image{width: 30; height:30; property var died: false; source: \"res/bubble_";

            for(; i < 8; i++){
                var qmlString = qmlStringBegin + (i+1) + ".png\";}";
                bubbles.children[i] = Qt.createQmlObject(qmlString, bubbles, "DynamicImage");
            }
        }

        function allDie(){
            return diedCount == children.length;
        }

        function reset(){
            diedCount = 0;
            var i = 0;
            var bubble;
            for(; i < bubbles.children.length; i++){
                bubble = bubbles.children[i];
                bubble.died = false;
                bubble.source = "res/bubble_" + (i+1) + ".png";
                bubble.opacity = 1.0;
            }
        }
    }
        Text {
            id: scoreInfo;
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.top: bubbles.bottom;
            anchors.topMargin: 4;
            font.pixelSize: 26;
            font.bold: true;
            color: "blue";
        }

        Image {
            id: turret;
            width: 50;
            height: 80;
            anchors.bottom: parent.bottom;
            anchors.horizontalCenter: parent.horizontalCenter;
            source: "res/turret.png";
            transformOrigin: Item.Bottom
        }

        Image {
            id: bullet;
            width: 40;
            height: 40;
            source: "res/knife.png";
            z: 2;
            visible: false;
        }
        NumberAnimation {
            property var rotateAngle: 0;

            function rotate(angle){
                rotateAngle += angle;
                if(running == false){
                    rotateTurret();
                }
            }

            function rotateTurret(){
                if(rotateAngle != 0){
                    from = turret.rotation;
                    to = turret.rotation + rotateAngle;
                    if(to > 80 ) to = 80;
                    else if(to < -80) to = -80;
                    var distance = to - from;
                    duration = 50//Math.min( 100 * Math.abs(distance / 3), 800);
                    start();
                    rotateAngle = 0;
                }
            }

            id: animateTurret;
            target: turret;
            property: "rotation";
            onStopped: {
                rotateTurret();
            }
        }
        Keys.onLeftPressed: animateTurret.rotate(-3);
        Keys.onRightPressed: animateTurret.rotate(3);
}

