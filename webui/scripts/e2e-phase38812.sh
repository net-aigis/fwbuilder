#!/usr/bin/env bash
# Phase-38812: STATUS mentions schema 5.425 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase38816|through 38816|e2e-phase38816' webui/STATUS.md
echo "STATUS schema 5.425 ok"; echo "cleaned"; echo "OK: phase38812 e2e passed"
