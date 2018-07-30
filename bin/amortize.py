#!/usr/bin/env python3
"""Amortization"""

import argparse
from typing import Union

from prettytable import PrettyTable


def main(args):
    principle: float = args.principle
    monthly_rate: float = args.apr / 100 / 12
    num_month: int = args.term
    compound_factor: float = (1 + monthly_rate) ** num_month
    monthly_payment: float = (principle * monthly_rate * compound_factor) / (compound_factor - 1)
    total: float = monthly_payment * num_month

    def format_number(x: Union[float, int]) -> str:
        return f"{int(x):_}"

    table: PrettyTable = PrettyTable()
    table.field_names = ["key", "value"]
    table.align["key"] = "l"
    table.align["value"] = "r"
    table.add_row(["principle", format_number(principle)])
    table.add_row(["apr", f"{args.apr}%"], divider=True)
    table.add_row(["total interest", format_number(total - principle)])
    table.add_row(["total payment", format_number(total)])
    table.add_row(["monthly payment", format_number(monthly_payment)])
    print(table)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument("-p", "--principle", type=float, required=True)
    parser.add_argument("-r", "--apr", type=float, required=True)
    parser.add_argument("-n", "--term", type=int, required=True)
    args = parser.parse_args()
    return args


if __name__ == "__main__":
    main(parse_args())
