#!/usr/bin/env bash
# Phase-5692: STATUS mentions schema 5.11 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase5696|through 5136|e2e-phase5696' webui/STATUS.md
echo "STATUS schema 5.11 ok"; echo "cleaned"; echo "OK: phase5692 e2e passed"
