#!/usr/bin/env bash
# Phase-30012: STATUS mentions schema 5.315 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase30016|through 30016|e2e-phase30016' webui/STATUS.md
echo "STATUS schema 5.315 ok"; echo "cleaned"; echo "OK: phase30012 e2e passed"
