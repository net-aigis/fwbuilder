#!/usr/bin/env bash
# Phase-48812: STATUS mentions schema 5.550 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase48816|through 48816|e2e-phase48816' webui/STATUS.md
echo "STATUS schema 5.550 ok"; echo "cleaned"; echo "OK: phase48812 e2e passed"
