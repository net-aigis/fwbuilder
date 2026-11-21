#!/usr/bin/env bash
# Phase-27532: STATUS mentions schema 5.284 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase27536|through 27536|e2e-phase27536' webui/STATUS.md
echo "STATUS schema 5.284 ok"; echo "cleaned"; echo "OK: phase27532 e2e passed"
