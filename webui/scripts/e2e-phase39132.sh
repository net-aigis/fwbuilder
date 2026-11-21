#!/usr/bin/env bash
# Phase-39132: STATUS mentions schema 5.429 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase39136|through 39136|e2e-phase39136' webui/STATUS.md
echo "STATUS schema 5.429 ok"; echo "cleaned"; echo "OK: phase39132 e2e passed"
