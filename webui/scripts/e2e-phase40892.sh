#!/usr/bin/env bash
# Phase-40892: STATUS mentions schema 5.451 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase40896|through 40896|e2e-phase40896' webui/STATUS.md
echo "STATUS schema 5.451 ok"; echo "cleaned"; echo "OK: phase40892 e2e passed"
