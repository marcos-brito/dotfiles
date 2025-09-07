import QtQuick
import qs.config

Canvas {
    id: root
    property string color: Theme.base00
    property int size: 60
    width: size
    height: size
    antialiasing: true
    renderTarget: Canvas.FramebufferObject
    smooth: true

    onPaint: {
        const ctx = getContext("2d");

        ctx.clearRect(0, 0, width, height);
        ctx.fillStyle = root.color
        ctx.fillRect(0, 0, width, height);
        ctx.globalCompositeOperation = "destination-out";
        ctx.beginPath();
        ctx.arc(0, height, root.size, 0, 2 * Math.PI);
        ctx.fill();
    }
}
