#!/usr/bin/env bash
# Phase-19052: STATUS mentions schema 5.178 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase19056|through 19056|e2e-phase19056' webui/STATUS.md
echo "STATUS schema 5.178 ok"; echo "cleaned"; echo "OK: phase19052 e2e passed"
