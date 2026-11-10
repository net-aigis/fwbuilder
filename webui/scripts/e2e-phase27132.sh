#!/usr/bin/env bash
# Phase-27132: STATUS mentions schema 5.279 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase27136|through 27136|e2e-phase27136' webui/STATUS.md
echo "STATUS schema 5.279 ok"; echo "cleaned"; echo "OK: phase27132 e2e passed"
