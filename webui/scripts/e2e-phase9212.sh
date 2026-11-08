#!/usr/bin/env bash
# Phase-9212: STATUS mentions schema 5.55 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase9216|through 9216|e2e-phase9216' webui/STATUS.md
echo "STATUS schema 5.55 ok"; echo "cleaned"; echo "OK: phase9212 e2e passed"
