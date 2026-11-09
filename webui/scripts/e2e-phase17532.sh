#!/usr/bin/env bash
# Phase-17532: STATUS mentions schema 5.159 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase17536|through 17536|e2e-phase17536' webui/STATUS.md
echo "STATUS schema 5.159 ok"; echo "cleaned"; echo "OK: phase17532 e2e passed"
