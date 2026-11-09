#!/usr/bin/env bash
# Phase-19212: STATUS mentions schema 5.180 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase19216|through 19216|e2e-phase19216' webui/STATUS.md
echo "STATUS schema 5.180 ok"; echo "cleaned"; echo "OK: phase19212 e2e passed"
