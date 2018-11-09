import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.11
import QtQuick.Shapes 1.0

Window {
    id: mainWindow
    visible: true
    width: 640
    minimumWidth: 500
    height: 480
    minimumHeight: 370
    title: 'QML Proof'
    color: 'darkgray'

    property int _pixelSize: 30
    property int _margin: 6
    property font _defaultFont: Qt.font({family: 'Courier', pixelSize: 30,  weight: Font.Normal })


    MouseArea
    {
        id: all
        cursorShape: mainModel.cursorShape
        anchors.fill: parent;
    }

    FontLoader
    {
        id: fontDefault;
        name: 'Courier';
    }

    Rectangle
    {
        id: rectFisrtRow
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.margins: _margin
        width: parent.width
        height: 50
        color: mainWindow.color
        //color: 'orange'

        Rectangle
        {
            id: rectTextField1
            height: rectFisrtRow.height
            anchors.left: rectFisrtRow.left
            anchors.right: rectButton1.left
            anchors.rightMargin: _margin
            //color: 'red'
            color: mainWindow.color
            TextField
            {
                id: myTextField1
                anchors.fill: parent
                placeholderText: "Text Field 1"
                maximumLength: 32
                text: mainModel.text1
                onTextEdited: mainModel.setText1(myTextField1.text)
                font: _defaultFont
            }
        }

        Rectangle
        {
            id: rectButton1
            anchors.right: rectFisrtRow.horizontalCenter
            anchors.margins: _margin
            width: 60
            height: rectFisrtRow.height
            //color: 'blue'
            color: mainWindow.color
            Button
            {
                id:myButton1
                anchors.fill: parent
                anchors.margins: _margin
                font: _defaultFont
                onClicked: mainModel.setText1(mainModel.text2)
                //text: '<'
                Shape
                {
                    id: shpButton1
                    anchors.fill: parent

                    ShapePath
                    {
                        id: shpthButton1

                        strokeColor: "black"
                        strokeWidth: 3
                        fillColor: "transparent"
                        capStyle: ShapePath.RoundCap

                        startX: 3*shpButton1.width/4;
                        startY: shpButton1.height/4;
                        PathLine
                        {
                            x: shpButton1.width/4;
                            y: shpButton1.height/2
                        }
                        PathLine
                        {
                            x: 3*shpButton1.width/4;
                            y: 3*shpButton1.height/4
                        }
                    }
                }
            }
        }

        Rectangle
        {
            id: rectButton2
            anchors.left: rectFisrtRow.horizontalCenter
            anchors.margins: _margin
            width: 60
            height: rectFisrtRow.height
            //color: 'green'
            color: mainWindow.color
            Button
            {
                id:myBoton2
                anchors.fill: parent
                anchors.margins: _margin
                font: _defaultFont
                onClicked: mainModel.setText2(mainModel.text1)
                // text: '>'
                Shape
                {
                    id: shpButton2
                    anchors.fill: parent

                    ShapePath
                    {
                        id: shpthButton2

                        strokeColor: "black"
                        strokeWidth: 3
                        fillColor: "transparent"
                        capStyle: ShapePath.RoundCap

                        startX: shpButton2.width/4;
                        startY: shpButton2.height/4;
                        PathLine
                        {
                            x: 3*shpButton2.width/4;
                            y: shpButton2.height/2
                        }
                        PathLine
                        {
                            x: shpButton2.width/4;
                            y: 3*shpButton2.height/4
                        }
                    }
                }

            }
        }

        Rectangle
        {
            id: rectTextField2
            anchors.left: rectButton2.right
            anchors.leftMargin: _margin
            anchors.right: rectFisrtRow.right
            height: rectFisrtRow.height
            //color: 'magenta'
            color: mainWindow.color
            TextField
            {
                id: myTextField2
                anchors.fill: parent
                maximumLength: 32
                placeholderText: "Text Field 2"
                font: _defaultFont
                text: mainModel.text2
                onTextEdited: mainModel.setText2(myTextField2.text)
            }
        }
    }

    GroupBox
    {
        id: gbText1Enabled
        anchors.top: rectFisrtRow.bottom
        anchors.left: rectFisrtRow.left
        anchors.topMargin: _margin
        title: "Text 1 Enabled?"

        RowLayout
        {
            RadioButton
            {
                text: "Yes"
                checked: true
                onClicked: myTextField1.enabled = true
            }
            RadioButton
            {
                text: "No"
                onClicked: myTextField1.enabled = false
            }
        }
    }

    Button
    {
        id:myNormalCursor
        anchors.top: gbText1Enabled.bottom
        anchors.left: rectFisrtRow.left
        anchors.topMargin: _margin
        text: 'Normal Cursor'
        font: _defaultFont
        onClicked: mainModel.setCursorShape(Qt.NormalCursor)
    }

    Button
    {
        id:myBusyCursor
        anchors.top: myNormalCursor.bottom
        anchors.left: rectFisrtRow.left
        anchors.topMargin: _margin
        text: 'Wait Cursor'
        font: _defaultFont
        onClicked: mainModel.setCursorShape(Qt.WaitCursor)
    }

    Button
    {
        id:myOpenHandCursor
        anchors.top: myBusyCursor.bottom
        anchors.left: rectFisrtRow.left
        anchors.topMargin: _margin
        text: 'Open Hand Cursor'
        font: _defaultFont
        onClicked: mainModel.setCursorShape(Qt.OpenHandCursor)
    }

    Button
    {
        id:myPointingHandCursor
        anchors.top: myOpenHandCursor.bottom
        anchors.left: rectFisrtRow.left
        anchors.topMargin: _margin
        text: 'Pointing Hand Cursor'
        font: _defaultFont
        onClicked: mainModel.setCursorShape(Qt.PointingHandCursor)
    }

    Button {
        id:myBotonPaSalir
        x:mainWindow.width-myBotonPaSalir.width-_margin
        y:mainWindow.height-myBotonPaSalir.height-_margin
        text: 'Quit'
        font: _defaultFont
        //enabled: false   // disable
        onClicked: Qt.quit()
    }
}
