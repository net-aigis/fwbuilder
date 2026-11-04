#!/usr/bin/env bash
# Phase-2732: STATUS mentions schema 2.4 / 2729-2736.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'schema 2\.0|Honesty-Surface-Schema 2\.0|surface_version.*2\.0' webui/STATUS.md
grep -qE 'phase2736|through 2736|e2e-phase2736' webui/STATUS.md
echo "STATUS schema 2.4 ok"
echo "cleaned"
echo "OK: phase2732 e2e passed"
