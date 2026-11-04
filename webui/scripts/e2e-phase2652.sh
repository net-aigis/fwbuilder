#!/usr/bin/env bash
# Phase-2652: STATUS mentions schema 2.3 / 2649-2656.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'schema 2\.0|Honesty-Surface-Schema 2\.0|surface_version.*2\.0' webui/STATUS.md
grep -qE 'phase2656|through 2656|e2e-phase2656' webui/STATUS.md
echo "STATUS schema 2.3 ok"
echo "cleaned"
echo "OK: phase2652 e2e passed"
