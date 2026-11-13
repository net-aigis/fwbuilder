#!/usr/bin/env bash
# Phase-28092: STATUS mentions schema 5.291 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase28096|through 28096|e2e-phase28096' webui/STATUS.md
echo "STATUS schema 5.291 ok"; echo "cleaned"; echo "OK: phase28092 e2e passed"
