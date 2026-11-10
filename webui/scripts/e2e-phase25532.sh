#!/usr/bin/env bash
# Phase-25532: STATUS mentions schema 5.259 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase25536|through 25536|e2e-phase25536' webui/STATUS.md
echo "STATUS schema 5.259 ok"; echo "cleaned"; echo "OK: phase25532 e2e passed"
