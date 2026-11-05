#!/usr/bin/env bash
# Phase-3212: STATUS mentions schema 3.0 / 3209-3216.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'schema 3\.0|Honesty-Surface-Schema 3\.0|surface_version.*3\.0' webui/STATUS.md
grep -qE 'phase3216|through 3216|e2e-phase3216' webui/STATUS.md
echo "STATUS schema 3.0 ok"
echo "cleaned"
echo "OK: phase3212 e2e passed"
