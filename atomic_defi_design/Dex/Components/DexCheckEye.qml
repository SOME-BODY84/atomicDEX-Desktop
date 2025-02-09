import QtQuick 2.15
import Qaterial 1.0 as Qaterial
import QtQuick.Layouts 1.12

import App 1.0
import Dex.Themes 1.0 as Dex

Item
{
    id: control

    property bool checked: eval("target." + control.targetProperty)
    property alias text: _label.text
    property alias iconSource: _icon.source
    property string targetProperty: ""
    property var target

    width: parent.width
    height: row.height

    RowLayout
    {
        id: row
        width: parent.width - 20
        spacing: 10
        Qaterial.ColorIcon
        {
            id: _icon
            Layout.alignment: Qt.AlignVCenter
            source: control.checked ? Qaterial.Icons.eyeOutline : Qaterial.Icons.eyeOffOutline
            color: control.checked ? Dex.CurrentTheme.foregroundColor : Dex.CurrentTheme.buttonTextDisabledColor
            iconSize: 17
            DexMouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                    if (control.checked) eval("target." + control.targetProperty + " = false")
                    else eval("target." + control.targetProperty + " = true")
                }
            }
        }
        DefaultText
        {
            id: _label
            font.pixelSize: 15
            text: ""
            color: control.checked ? Dex.CurrentTheme.foregroundColor : Dex.CurrentTheme.buttonTextDisabledColor
            opacity: .5
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignVCenter
        }
    }
}
