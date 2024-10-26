import os

import pandas


def hello(name: str) -> str:
    if len(name) == 4:
        resp = "person"
    else:
        resp = "animal"
    return f"Hello, {resp}.\nHow are you"


def main() -> int:
    print(hello("user"))
    return 0


if __name__ == "__main__":
    main()
