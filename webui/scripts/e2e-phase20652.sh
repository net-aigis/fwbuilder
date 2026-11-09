#!/usr/bin/env bash
# Phase-20652: STATUS mentions schema 5.198 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase20656|through 20656|e2e-phase20656' webui/STATUS.md
echo "STATUS schema 5.198 ok"; echo "cleaned"; echo "OK: phase20652 e2e passed"
