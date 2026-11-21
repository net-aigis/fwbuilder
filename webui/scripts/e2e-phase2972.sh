#!/usr/bin/env bash
# Phase-2972: STATUS mentions schema 2.7 / 2969-2976.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'schema 2\.7|Honesty-Surface-Schema 2\.7|surface_version.*2\.7' webui/STATUS.md
grep -qE 'phase2976|through 2976|e2e-phase2976' webui/STATUS.md
echo "STATUS schema 2.7 ok"
echo "cleaned"
echo "OK: phase2972 e2e passed"
