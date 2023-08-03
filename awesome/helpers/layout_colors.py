#!/bin/python

from PIL import Image
import argparse
import re
import sys
import os


def change_color(file_path, color):
    print(color)
    try:
        with Image.open(file_path) as img:
            rgba_img = img.convert("RGBA")

            pixels = rgba_img.load()

            for i in range(rgba_img.size[0]):
                for j in range(rgba_img.size[1]):
                    if pixels[i, j] != (0, 0, 0, 0):
                        pixels[i, j] = color

            rgba_img.save(file_path)
    except OSError:
        sys.stderr.write("Could not chage the color")


def is_hexa(string):
    if len(string) < 7:
        return False
    match = re.search(r"^#(?:[0-9a-fA-F]{3}){1,2}$", string)
    if match:
        return True
    else:
        return False


def hex_to_rgb(hex):
    rgb = []

    for i in (0, 2, 4):
        decimal = int(hex[i : i + 2], 16)
        rgb.append(decimal)

    return tuple(rgb) + tuple([255])


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="This CLI is used to change the layout icons color from one of your themes"
    )
    parser.add_argument("theme", help="The theme name")
    parser.add_argument("color", help="A hex color")
    args = parser.parse_args()

    HOME = os.environ["HOME"]
    themes_path = HOME + "/.config/awesome/themes"
    layout = themes_path + "/" + args.theme + "/layouts"

    if not os.path.exists(layout):
        sys.stderr.write("No theme at" + layout)
        exit(1)

    if not is_hexa(args.color):
        sys.stderr.write("Invalid color. Try {'#yyyyyy'}")
        exit(1)

    rgb = hex_to_rgb(args.color.removeprefix("#"))

    for file in os.listdir(layout):
        file_path = layout + "/" + file
        change_color(file_path, rgb)
