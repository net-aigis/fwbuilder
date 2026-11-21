#!/usr/bin/env bash
# Phase-3132: STATUS mentions schema 2.9 / 3129-3136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'schema 2\.9|Honesty-Surface-Schema 2\.9|surface_version.*2\.9' webui/STATUS.md
grep -qE 'phase3136|through 3136|e2e-phase3136' webui/STATUS.md
echo "STATUS schema 2.9 ok"
echo "cleaned"
echo "OK: phase3132 e2e passed"
