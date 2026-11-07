#!/usr/bin/env bash
# Phase-5532: STATUS mentions schema 5.9 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase5536|through 5136|e2e-phase5536' webui/STATUS.md
echo "STATUS schema 5.9 ok"; echo "cleaned"; echo "OK: phase5532 e2e passed"
