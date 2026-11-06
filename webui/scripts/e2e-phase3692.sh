#!/usr/bin/env bash
# Phase-3692: STATUS mentions schema 3.6 / 3689-3696.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'schema 3\.6|Honesty-Surface-Schema 3\.6|surface_version.*3\.6' webui/STATUS.md
grep -qE 'phase3696|through 3696|e2e-phase3696' webui/STATUS.md
echo "STATUS schema 3.6 ok"
echo "cleaned"
echo "OK: phase3692 e2e passed"
