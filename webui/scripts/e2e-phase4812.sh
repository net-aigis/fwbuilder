#!/usr/bin/env bash
# Phase-4812: STATUS mentions schema 5.0 / 4809-4816.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.0|Honesty-Surface-Schema 5\.0|surface_version=5\.0|soft_fertig_honesty_surface_version 5\.0' webui/STATUS.md
grep -qE 'phase4816|through 4816|e2e-phase4816' webui/STATUS.md
echo "STATUS schema 5.0 ok"; echo "cleaned"; echo "OK: phase4812 e2e passed"
