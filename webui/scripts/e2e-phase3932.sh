#!/usr/bin/env bash
# Phase-3932: STATUS mentions schema 3.9 / 3929-3936.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'schema 3\.9|Honesty-Surface-Schema 3\.9|surface_version.*3\.9' webui/STATUS.md
grep -qE 'phase3936|through 3936|e2e-phase3936' webui/STATUS.md
echo "STATUS schema 3.9 ok"
echo "cleaned"
echo "OK: phase3932 e2e passed"
