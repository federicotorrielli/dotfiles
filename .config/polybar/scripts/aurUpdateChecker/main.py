#!/usr/bin/env python3
import subprocess
from pathlib import Path

import requests as requests


def check_internet_connection():
    url = "https://evilscript.altervista.org/"
    timeout = 5
    try:
        requests.get(url, timeout=timeout)
        return True
    except (requests.ConnectionError, requests.Timeout) as _:
        return False


def get_project_root():
    return Path(__file__).parent


def check_updates():
    first_process = subprocess.Popen(['/usr/bin/bash', f'{get_project_root()}/checkaurupdates'], stdout=subprocess.PIPE,
                                     text=True)
    first_result = int(subprocess.check_output(['/usr/bin/wc', '-l'], stdin=first_process.stdout, text=True))
    second_process = subprocess.Popen(['/usr/bin/bash', '/usr/bin/checkupdates'], stdout=subprocess.PIPE, text=True)
    second_result = int(subprocess.check_output(['/usr/bin/wc', '-l'], stdin=second_process.stdout, text=True))
    updates = first_result + second_result
    if updates < 15:
        print("No need to update")
    else:
        print(f"Updates: {updates}")


if __name__ == '__main__':
    if check_internet_connection():
        check_updates()
