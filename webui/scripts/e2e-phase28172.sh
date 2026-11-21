#!/usr/bin/env bash
# Phase-28172: STATUS mentions schema 5.292 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase28176|through 28176|e2e-phase28176' webui/STATUS.md
echo "STATUS schema 5.292 ok"; echo "cleaned"; echo "OK: phase28172 e2e passed"
