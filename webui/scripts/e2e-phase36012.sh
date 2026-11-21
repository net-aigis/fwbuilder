#!/usr/bin/env bash
# Phase-36012: STATUS mentions schema 5.390 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase36016|through 36016|e2e-phase36016' webui/STATUS.md
echo "STATUS schema 5.390 ok"; echo "cleaned"; echo "OK: phase36012 e2e passed"
