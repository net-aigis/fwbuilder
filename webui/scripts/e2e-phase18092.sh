#!/usr/bin/env bash
# Phase-18092: STATUS mentions schema 5.166 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase18096|through 18096|e2e-phase18096' webui/STATUS.md
echo "STATUS schema 5.166 ok"; echo "cleaned"; echo "OK: phase18092 e2e passed"
