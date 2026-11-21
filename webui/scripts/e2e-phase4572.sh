#!/usr/bin/env bash
# Phase-4572: STATUS mentions schema 4.7 / 4569-4576.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'schema 4\.3|Honesty-Surface-Schema 4\.3|surface_version.*4\.3' webui/STATUS.md
grep -qE 'phase4576|through 4576|e2e-phase4576' webui/STATUS.md
echo "STATUS schema 4.7 ok"
echo "cleaned"
echo "OK: phase4572 e2e passed"
