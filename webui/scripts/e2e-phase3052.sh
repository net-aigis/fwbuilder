#!/usr/bin/env bash
# Phase-3052: STATUS mentions schema 2.8 / 3049-3056.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'schema 2\.8|Honesty-Surface-Schema 2\.8|surface_version.*2\.8' webui/STATUS.md
grep -qE 'phase3056|through 3056|e2e-phase3056' webui/STATUS.md
echo "STATUS schema 2.8 ok"
echo "cleaned"
echo "OK: phase3052 e2e passed"
