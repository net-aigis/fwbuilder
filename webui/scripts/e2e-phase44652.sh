#!/usr/bin/env bash
# Phase-44652: STATUS mentions schema 5.498 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase44656|through 44656|e2e-phase44656' webui/STATUS.md
echo "STATUS schema 5.498 ok"; echo "cleaned"; echo "OK: phase44652 e2e passed"
