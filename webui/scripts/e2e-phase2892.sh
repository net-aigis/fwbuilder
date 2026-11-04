#!/usr/bin/env bash
# Phase-2892: STATUS mentions schema 2.6 / 2889-2896.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'schema 2\.6|Honesty-Surface-Schema 2\.6|surface_version.*2\.6' webui/STATUS.md
grep -qE 'phase2896|through 2896|e2e-phase2896' webui/STATUS.md
echo "STATUS schema 2.6 ok"
echo "cleaned"
echo "OK: phase2892 e2e passed"
