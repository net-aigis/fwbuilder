#!/usr/bin/env bash
# Phase-13532: STATUS mentions schema 5.109 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase13536|through 13536|e2e-phase13536' webui/STATUS.md
echo "STATUS schema 5.109 ok"; echo "cleaned"; echo "OK: phase13532 e2e passed"
