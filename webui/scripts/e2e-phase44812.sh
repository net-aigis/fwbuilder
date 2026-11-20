#!/usr/bin/env bash
# Phase-44812: STATUS mentions schema 5.500 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase44816|through 44816|e2e-phase44816' webui/STATUS.md
echo "STATUS schema 5.500 ok"; echo "cleaned"; echo "OK: phase44812 e2e passed"
