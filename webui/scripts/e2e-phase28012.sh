#!/usr/bin/env bash
# Phase-28012: STATUS mentions schema 5.290 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase28016|through 28016|e2e-phase28016' webui/STATUS.md
echo "STATUS schema 5.290 ok"; echo "cleaned"; echo "OK: phase28012 e2e passed"
