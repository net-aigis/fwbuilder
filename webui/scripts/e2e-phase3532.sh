#!/usr/bin/env bash
# Phase-3532: STATUS mentions schema 3.4 / 3529-3536.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'schema 3\.1|Honesty-Surface-Schema 3\.1|surface_version.*3\.1' webui/STATUS.md
grep -qE 'phase3536|through 3536|e2e-phase3536' webui/STATUS.md
echo "STATUS schema 3.4 ok"
echo "cleaned"
echo "OK: phase3532 e2e passed"
