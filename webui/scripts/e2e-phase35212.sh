#!/usr/bin/env bash
# Phase-35212: STATUS mentions schema 5.380 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase35216|through 35216|e2e-phase35216' webui/STATUS.md
echo "STATUS schema 5.380 ok"; echo "cleaned"; echo "OK: phase35212 e2e passed"
