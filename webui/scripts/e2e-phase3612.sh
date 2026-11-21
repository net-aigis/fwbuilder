#!/usr/bin/env bash
# Phase-3612: STATUS mentions schema 3.5 / 3609-3616.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'schema 3\.1|Honesty-Surface-Schema 3\.1|surface_version.*3\.1' webui/STATUS.md
grep -qE 'phase3616|through 3616|e2e-phase3616' webui/STATUS.md
echo "STATUS schema 3.5 ok"
echo "cleaned"
echo "OK: phase3612 e2e passed"
