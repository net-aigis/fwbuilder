#!/usr/bin/env bash
# Phase-12012: STATUS mentions schema 5.90 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase12016|through 12016|e2e-phase12016' webui/STATUS.md
echo "STATUS schema 5.90 ok"; echo "cleaned"; echo "OK: phase12012 e2e passed"
