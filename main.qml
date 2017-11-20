import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3

Window {
    visible: true
    width: 480
    height: 706
    title: qsTr("Hello World")

    Item {
        anchors.fill: parent
        anchors.topMargin: 110
        anchors.leftMargin: 30
        anchors.rightMargin: 30

        MouseArea {
            id: outerMouseArea
            anchors.fill: parent
            hoverEnabled: true

            Grid {
                id: pathView
                anchors.fill: parent
                columns: 3
                rows: 4
                rowSpacing: 16; columnSpacing: 16;

                Repeater {
                    id: repeater
                    model: 12

                    Rectangle {
                        id: rect
                        width: 129
                        height: 129
                        color: Qt.hsla((0.5 + index)/repeater.count, 0.5, 0.7, 1)

                        scale: mouseArea.containsMouse ? 1.25 : outerMouseArea.containsMouse ? 0.75 : 1.0
                        Behavior on scale { NumberAnimation { duration: 200; easing.type: Easing.Linear } }
                        MouseArea {
                            id: mouseArea
                            anchors.fill: parent
                            hoverEnabled: true
                        }
                    }
                }
            }
        }
    }
}
