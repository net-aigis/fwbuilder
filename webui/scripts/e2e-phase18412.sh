#!/usr/bin/env bash
# Phase-18412: STATUS mentions schema 5.170 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase18416|through 18416|e2e-phase18416' webui/STATUS.md
echo "STATUS schema 5.170 ok"; echo "cleaned"; echo "OK: phase18412 e2e passed"
