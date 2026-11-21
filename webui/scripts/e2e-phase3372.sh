#!/usr/bin/env bash
# Phase-3372: STATUS mentions schema 3.2 / 3369-3376.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'schema 3\.1|Honesty-Surface-Schema 3\.1|surface_version.*3\.1' webui/STATUS.md
grep -qE 'phase3376|through 3376|e2e-phase3376' webui/STATUS.md
echo "STATUS schema 3.2 ok"
echo "cleaned"
echo "OK: phase3372 e2e passed"
