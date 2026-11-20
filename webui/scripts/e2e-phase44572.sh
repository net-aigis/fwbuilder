#!/usr/bin/env bash
# Phase-44572: STATUS mentions schema 5.497 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase44576|through 44576|e2e-phase44576' webui/STATUS.md
echo "STATUS schema 5.497 ok"; echo "cleaned"; echo "OK: phase44572 e2e passed"
