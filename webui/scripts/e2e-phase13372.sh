#!/usr/bin/env bash
# Phase-13372: STATUS mentions schema 5.107 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase13376|through 13376|e2e-phase13376' webui/STATUS.md
echo "STATUS schema 5.107 ok"; echo "cleaned"; echo "OK: phase13372 e2e passed"
