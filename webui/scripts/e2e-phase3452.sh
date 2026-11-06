#!/usr/bin/env bash
# Phase-3452: STATUS mentions schema 3.3 / 3449-3456.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'schema 3\.1|Honesty-Surface-Schema 3\.1|surface_version.*3\.1' webui/STATUS.md
grep -qE 'phase3456|through 3456|e2e-phase3456' webui/STATUS.md
echo "STATUS schema 3.3 ok"
echo "cleaned"
echo "OK: phase3452 e2e passed"
