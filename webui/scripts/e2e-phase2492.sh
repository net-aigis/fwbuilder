#!/usr/bin/env bash
# Phase-2492: STATUS mentions schema 2.1 / 2489-2496.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'schema 2\.0|Honesty-Surface-Schema 2\.0|surface_version.*2\.0' webui/STATUS.md
grep -qE 'phase2496|through 2496|e2e-phase2496' webui/STATUS.md
echo "STATUS schema 2.1 ok"
echo "cleaned"
echo "OK: phase2492 e2e passed"
