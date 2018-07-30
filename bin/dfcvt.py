#!/usr/bin/env python
"""
DataFrame ConVerTion
"""
import argparse
import json

import pandas as pd


def read_jsonl(file_path: str) -> pd.DataFrame:
    with open(file_path, "r", encoding="utf-8") as f:
        lines = [json.loads(line.strip()) for line in f]
    return pd.DataFrame(lines)


def write_jsonl(df: pd.DataFrame, file_path: str) -> None:
    df.to_json(file_path, orient="records", lines=True, force_ascii=False)


def read_csv_or_tsv(file_path: str, delimiter: str) -> pd.DataFrame:
    return pd.read_csv(file_path, sep=delimiter, encoding="utf-8")


def write_csv_or_tsv(df: pd.DataFrame, file_path: str, delimiter: str) -> None:
    df.to_csv(file_path, sep=delimiter, index=False, encoding="utf-8")


def read_parquet(file_path: str) -> pd.DataFrame:
    return pd.read_parquet(file_path)


def write_parquet(df: pd.DataFrame, file_path: str) -> None:
    df.to_parquet(file_path)


def read_xlsx(file_path: str) -> pd.DataFrame:
    return pd.read_excel(file_path, engine="openpyxl")


def write_xlsx(df: pd.DataFrame, file_path: str) -> None:
    df.to_excel(file_path, index=False, engine="openpyxl")


def infer_format(file_path: str) -> str:
    ext = file_path.split(".")[-1].lower()
    if ext == "jsonl":
        return "jsonl"
    if ext in ["csv", "tsv"]:
        return ext
    if ext == "parquet":
        return "parquet"
    if ext == "xlsx":
        return "xlsx"
    raise ValueError(f"Unsupported file extension: {ext}")


def convert(input_file: str, output_file: str, input_format: str = "", output_format: str = "") -> None:
    """Convert between file formats."""
    if not input_format:
        input_format = infer_format(input_file)
    if not output_format:
        output_format = infer_format(output_file)

    # Read data
    if input_format == "jsonl":
        df = read_jsonl(input_file)
    elif input_format in ["csv", "tsv"]:
        delimiter = "," if input_format == "csv" else "\t"
        df = read_csv_or_tsv(input_file, delimiter)
    elif input_format == "parquet":
        df = read_parquet(input_file)
    elif input_format == "xlsx":
        df = read_xlsx(input_file)
    else:
        raise ValueError(f"Unsupported input format: {input_format}")

    # Write data
    if output_format == "jsonl":
        write_jsonl(df, output_file)
    elif output_format in ["csv", "tsv"]:
        delimiter = "," if output_format == "csv" else "\t"
        write_csv_or_tsv(df, output_file, delimiter)
    elif output_format == "parquet":
        write_parquet(df, output_file)
    elif output_format == "xlsx":
        write_xlsx(df, output_file)
    else:
        raise ValueError(f"Unsupported output format: {output_format}")


def main() -> None:
    parser = argparse.ArgumentParser(description="Convert between file formats.")
    parser.add_argument("input", help="Input file path")
    parser.add_argument("output", help="Output file path")
    parser.add_argument(
        "--input-format",
        "-i",
        choices=["jsonl", "csv", "tsv", "parquet", "xlsx"],
        help="Input format (infer from extension if not provided)",
    )
    parser.add_argument(
        "--output-format",
        "-o",
        choices=["jsonl", "csv", "tsv", "parquet", "xlsx"],
        help="Output format (infer from extension if not provided)",
    )
    args = parser.parse_args()

    convert(args.input, args.output, args.input_format, args.output_format)


if __name__ == "__main__":
    main()
