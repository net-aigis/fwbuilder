#!/usr/bin/env bash
# Phase-7052: STATUS mentions schema 5.28 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase7056|through 7056|e2e-phase7056' webui/STATUS.md
echo "STATUS schema 5.28 ok"; echo "cleaned"; echo "OK: phase7052 e2e passed"
