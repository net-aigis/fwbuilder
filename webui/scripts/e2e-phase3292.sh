#!/usr/bin/env bash
# Phase-3292: STATUS mentions schema 3.1 / 3289-3296.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'schema 3\.1|Honesty-Surface-Schema 3\.1|surface_version.*3\.1' webui/STATUS.md
grep -qE 'phase3296|through 3296|e2e-phase3296' webui/STATUS.md
echo "STATUS schema 3.1 ok"
echo "cleaned"
echo "OK: phase3292 e2e passed"
