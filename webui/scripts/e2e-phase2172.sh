#!/usr/bin/env bash
# Phase-2172: STATUS mentions schema 1.7 / 2169-2176.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '1\.7|schema 1\.7|Schema 1\.7|surface_version=1\.7' webui/STATUS.md
grep -qE 'phase2176|through 2176|e2e-phase2176' webui/STATUS.md
echo "STATUS schema 1.7 ok"
echo "cleaned"
echo "OK: phase2172 e2e passed"
