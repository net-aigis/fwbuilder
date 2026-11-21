#!/usr/bin/env bash
# Phase-2780: STATUS mentions changelog roster / 2777-2784.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'changelog_roster|changelog roster' webui/STATUS.md
grep -qE 'phase2784|through 2784|e2e-phase2784' webui/STATUS.md
echo "STATUS changelog roster ok"
echo "cleaned"
echo "OK: phase2780 e2e passed"
