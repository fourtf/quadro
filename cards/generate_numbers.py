from PyQt5 import Qt, QtGui, QtCore

brush_width = 4
font_size = 20
font = "Arial"
image_size = 128

app = QtGui.QGuiApplication([])

for color_name, color in [('blue', '#0066D3'), ('green', '#32D32A'), ('blue', '#FF001D'), ('yellow', '#FFD800')]:
    print("drawing", color_name, color)
    for text in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'Draw 2', 'Choose\nColor', 'Draw 4']:
        img = QtGui.QImage(image_size, image_size, QtGui.QImage.Format_ARGB32)
        img.fill(QtGui.QColor(0, 0, 0, 0))

        painter = QtGui.QPainter(img)

        painter.setPen(QtGui.QPen(QtGui.QColor(color), 1))
        painter.setFont(QtGui.QFont(font, font_size))
        painter.drawText(QtCore.QRect(0, 0, image_size, image_size), QtCore.Qt.AlignCenter, text)

        painter.end()
        img.save(f"{color_name}_{text.replace(' ', '-')}.png")