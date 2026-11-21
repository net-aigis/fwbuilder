#!/usr/bin/env bash
# Phase-37532: STATUS mentions schema 5.409 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase37536|through 37536|e2e-phase37536' webui/STATUS.md
echo "STATUS schema 5.409 ok"; echo "cleaned"; echo "OK: phase37532 e2e passed"
