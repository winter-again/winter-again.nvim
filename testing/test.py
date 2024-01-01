import os

import pandas


def hello(name):
    if len(name) == 4:
        resp = "person"
    else:
        resp = "animal"
    return f"Hello, {resp}"


def main():
    print(hello("user"))


if __name__ == "__main__":
    main()
