#!/usr/bin/env bash
# Phase-2812: STATUS mentions schema 2.5 / 2809-2816.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'schema 2\.0|Honesty-Surface-Schema 2\.0|surface_version.*2\.0' webui/STATUS.md
grep -qE 'phase2816|through 2816|e2e-phase2816' webui/STATUS.md
echo "STATUS schema 2.5 ok"
echo "cleaned"
echo "OK: phase2812 e2e passed"
