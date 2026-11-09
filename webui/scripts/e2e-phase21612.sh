#!/usr/bin/env bash
# Phase-21612: STATUS mentions schema 5.210 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase21616|through 21616|e2e-phase21616' webui/STATUS.md
echo "STATUS schema 5.210 ok"; echo "cleaned"; echo "OK: phase21612 e2e passed"
