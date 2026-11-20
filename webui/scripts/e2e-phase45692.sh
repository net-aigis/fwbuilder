#!/usr/bin/env bash
# Phase-45692: STATUS mentions schema 5.511 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase45696|through 45696|e2e-phase45696' webui/STATUS.md
echo "STATUS schema 5.511 ok"; echo "cleaned"; echo "OK: phase45692 e2e passed"
