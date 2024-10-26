import os
from pathlib import Path

import pandas


def hello(name: str) -> str:
    """
    doc comment
    """
    if len(name) == 4:
        resp = "person"
    else:
        resp = "animal"
    return f"Hello, {resp}.\nHow are you"


def main() -> int:
    print(hello("user"))

    bar = Path("./test.py")
    print(bar)
    return 0


if __name__ == "__main__":
    main()
