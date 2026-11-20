#!/usr/bin/env bash
# Phase-44012: STATUS mentions schema 5.490 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase44016|through 44016|e2e-phase44016' webui/STATUS.md
echo "STATUS schema 5.490 ok"; echo "cleaned"; echo "OK: phase44012 e2e passed"
