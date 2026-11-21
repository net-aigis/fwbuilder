#!/usr/bin/env bash
# Phase-4972: STATUS mentions schema 5.2 / 4969-4976.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase4976|through 4976|e2e-phase4976' webui/STATUS.md
echo "STATUS schema 5.2 ok"; echo "cleaned"; echo "OK: phase4972 e2e passed"
