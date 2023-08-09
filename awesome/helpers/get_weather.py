#!/bin/python

import requests
import json
import math
import os


def read_credential(path):
    with open(path) as file:
        content = file.readlines()
    credentials = {"key": content[0].strip("\n"), "city": content[1].strip("\n")}
    return credentials


if __name__ == "__main__":
    HOME = os.environ["HOME"]
    PATH = f"{HOME}/.config/awesome/open_weather"
    CREDENTIALS = read_credential(PATH)
    URL = f"https://api.openweathermap.org/data/2.5/weather?id={CREDENTIALS['city']}&appid={CREDENTIALS['key']}"

    response = json.loads(requests.get(URL).content)
    temperature = math.floor((response["main"]["temp"] - 273.15) + 0.5)
    description = response["weather"][0]["main"]

    print(temperature, description)
