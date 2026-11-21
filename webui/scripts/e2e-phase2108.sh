#!/usr/bin/env bash
# Phase-2108: STATUS mentions schema 1.6 / 2105-2112.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '1\.6|schema 1\.6|Schema 1\.6|surface_version=1\.6' webui/STATUS.md
grep -qE 'phase2112|through 2112|e2e-phase2112' webui/STATUS.md
echo "STATUS schema 1.6 ok"
echo "cleaned"
echo "OK: phase2108 e2e passed"
