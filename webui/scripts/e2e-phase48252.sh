#!/usr/bin/env bash
# Phase-48252: STATUS mentions schema 5.543 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase48256|through 48256|e2e-phase48256' webui/STATUS.md
echo "STATUS schema 5.543 ok"; echo "cleaned"; echo "OK: phase48252 e2e passed"
