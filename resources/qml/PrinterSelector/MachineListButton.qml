// Copyright (c) 2022 Ultimaker B.V.
// Cura is released under the terms of the LGPLv3 or higher.

import QtQuick 2.10
import QtQuick.Controls 2.3

import UM 1.5 as UM
import Cura 1.0 as Cura


Button
{
    id: machineListButton

    width: parent.width
    height: UM.Theme.getSize("large_button").height
    leftPadding: UM.Theme.getSize("default_margin").width
    rightPadding: UM.Theme.getSize("default_margin").width
    checkable: true
    hoverEnabled: true

    contentItem: Item
    {
        width: machineListButton.width - machineListButton.leftPadding - machineListButton.rightPadding
        height: UM.Theme.getSize("action_button").height

        UM.ColorImage
        {
            id: printerIcon
            height: UM.Theme.getSize("medium_button").height
            width: UM.Theme.getSize("medium_button").width
            color: UM.Theme.getColor("machine_selector_printer_icon")
            visible: model.isAbstractMachine || !model.isOnline
            source: model.isAbstractMachine ? UM.Theme.getIcon("PrinterTriple", "medium") : UM.Theme.getIcon("Printer", "medium")

            anchors
            {
                left: parent.left
                verticalCenter: parent.verticalCenter
            }
        }

        UM.Label
        {
            id: buttonText
            anchors
            {
                left: printerIcon.right
                right: printerCount.left
                verticalCenter: parent.verticalCenter
                leftMargin: UM.Theme.getSize("default_margin").width
            }
            text: machineListButton.text
            font: model.isAbstractMachine ? UM.Theme.getFont("medium_bold") : UM.Theme.getFont("medium")
            visible: text != ""
            elide: Text.ElideRight
        }

        Rectangle
        {
            id: printerCount
            color: UM.Theme.getColor("background_2")
            radius: height
            width: height
            anchors
            {
                right: parent.right
                top: buttonText.top
                bottom: buttonText.bottom
            }
            visible: model.isAbstractMachine

            UM.Label
            {
                text: model.machineCount
                anchors.centerIn: parent
                font: UM.Theme.getFont("default_bold")
            }
        }
    }

    background: Rectangle
    {
        id: backgroundRect
        color: machineListButton.hovered ? UM.Theme.getColor("action_button_hovered") : "transparent"
    }
}
