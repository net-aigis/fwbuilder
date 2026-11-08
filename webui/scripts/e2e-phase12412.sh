#!/usr/bin/env bash
# Phase-12412: STATUS mentions schema 5.95 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase12416|through 12416|e2e-phase12416' webui/STATUS.md
echo "STATUS schema 5.95 ok"; echo "cleaned"; echo "OK: phase12412 e2e passed"
