#!/usr/bin/env bash
# Phase-2796: STATUS mentions changelog_roster export / 2793-2800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'changelog_roster.*(export|bundle)|export.*changelog_roster|bundle.*changelog_roster' webui/STATUS.md
grep -qE 'phase2800|through 2800|e2e-phase2800' webui/STATUS.md
echo "STATUS changelog_roster export ok"
echo "cleaned"
echo "OK: phase2796 e2e passed"
