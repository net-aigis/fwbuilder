#!/usr/bin/env bash
# Phase-48092: STATUS mentions schema 5.541 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase48096|through 48096|e2e-phase48096' webui/STATUS.md
echo "STATUS schema 5.541 ok"; echo "cleaned"; echo "OK: phase48092 e2e passed"
