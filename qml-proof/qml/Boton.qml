import QtQuick 2.0

Rectangle { // size controlled by height
    id: root

// public
    property string text: 'text'
    property string textColor: 'textColor'
    property font font: Qt.font({ family: 'Encode Sans', weight: Font.Black, italic: false, pointSize: 24})
    signal clicked(); // onClicked: print('onClicked')

// private
    width: 250;  height: 50 // default size
    border.width: 2
    radius:       2
    opacity:      enabled? 1: 0.3 // disabled state

    Text {
        id: internalText
        text: root.text
        color: root.textColor
        font: root.font
        anchors.centerIn: parent
    }

    MouseArea {
        anchors.fill: parent
        onPressed:  parent.opacity = 0.5 // down state
        onReleased: parent.opacity = 1
        onCanceled: parent.opacity = 1
        onClicked:  root.clicked() // emit
    }
}
