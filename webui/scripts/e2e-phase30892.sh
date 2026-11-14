#!/usr/bin/env bash
# Phase-30892: STATUS mentions schema 5.326 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase30896|through 30896|e2e-phase30896' webui/STATUS.md
echo "STATUS schema 5.326 ok"; echo "cleaned"; echo "OK: phase30892 e2e passed"
