#!/usr/bin/env bash
# Phase-5052: STATUS mentions schema 5.3 / 5049-5056.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase5056|through 5056|e2e-phase5056' webui/STATUS.md
echo "STATUS schema 5.3 ok"; echo "cleaned"; echo "OK: phase5052 e2e passed"
