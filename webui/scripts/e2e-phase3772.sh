#!/usr/bin/env bash
# Phase-3772: STATUS mentions schema 3.7 / 3769-3776.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'schema 3\.7|Honesty-Surface-Schema 3\.7|surface_version.*3\.7' webui/STATUS.md
grep -qE 'phase3776|through 3776|e2e-phase3776' webui/STATUS.md
echo "STATUS schema 3.7 ok"
echo "cleaned"
echo "OK: phase3772 e2e passed"
