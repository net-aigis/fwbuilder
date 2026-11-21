#!/usr/bin/env bash
# Phase-1868: STATUS mentions schema 1.2 / 1865-1872.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '1\.2|schema 1\.2|Schema 1\.2|surface_version=1\.2' webui/STATUS.md
grep -qE 'phase1872|through 1872|e2e-phase1872' webui/STATUS.md
echo "STATUS schema 1.2 ok"
echo "cleaned"
echo "OK: phase1868 e2e passed"
