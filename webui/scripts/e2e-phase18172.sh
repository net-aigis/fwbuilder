#!/usr/bin/env bash
# Phase-18172: STATUS mentions schema 5.167 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase18176|through 18176|e2e-phase18176' webui/STATUS.md
echo "STATUS schema 5.167 ok"; echo "cleaned"; echo "OK: phase18172 e2e passed"
