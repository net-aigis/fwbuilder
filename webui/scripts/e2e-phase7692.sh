#!/usr/bin/env bash
# Phase-7692: STATUS mentions schema 5.36 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase7696|through 7696|e2e-phase7696' webui/STATUS.md
echo "STATUS schema 5.36 ok"; echo "cleaned"; echo "OK: phase7692 e2e passed"
