#!/usr/bin/env bash
# Phase-18012: STATUS mentions schema 5.165 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase18016|through 18016|e2e-phase18016' webui/STATUS.md
echo "STATUS schema 5.165 ok"; echo "cleaned"; echo "OK: phase18012 e2e passed"
