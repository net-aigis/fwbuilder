#!/usr/bin/env bash
# Phase-2028: STATUS mentions schema 1.5 / 2025-2032.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '1\.5|schema 1\.5|Schema 1\.5|surface_version=1\.5' webui/STATUS.md
grep -qE 'phase2032|through 2032|e2e-phase2032' webui/STATUS.md
echo "STATUS schema 1.5 ok"
echo "cleaned"
echo "OK: phase2028 e2e passed"
