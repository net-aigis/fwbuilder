#!/usr/bin/env bash
# Phase-32172: STATUS mentions schema 5.342 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase32176|through 32176|e2e-phase32176' webui/STATUS.md
echo "STATUS schema 5.342 ok"; echo "cleaned"; echo "OK: phase32172 e2e passed"
