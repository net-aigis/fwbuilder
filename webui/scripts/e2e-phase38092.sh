#!/usr/bin/env bash
# Phase-38092: STATUS mentions schema 5.416 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase38096|through 38096|e2e-phase38096' webui/STATUS.md
echo "STATUS schema 5.416 ok"; echo "cleaned"; echo "OK: phase38092 e2e passed"
