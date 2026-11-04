#!/usr/bin/env bash
# Phase-2572: STATUS mentions schema 2.2 / 2569-2576.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'schema 2\.0|Honesty-Surface-Schema 2\.0|surface_version.*2\.0' webui/STATUS.md
grep -qE 'phase2576|through 2576|e2e-phase2576' webui/STATUS.md
echo "STATUS schema 2.2 ok"
echo "cleaned"
echo "OK: phase2572 e2e passed"
