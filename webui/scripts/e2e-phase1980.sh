#!/usr/bin/env bash
# Phase-1980: STATUS mentions schema 1.4 / 1977-1984.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '1\.4|schema 1\.4|Schema 1\.4|surface_version=1\.4' webui/STATUS.md
grep -qE 'phase1984|through 1984|e2e-phase1984' webui/STATUS.md
echo "STATUS schema 1.4 ok"
echo "cleaned"
echo "OK: phase1980 e2e passed"
