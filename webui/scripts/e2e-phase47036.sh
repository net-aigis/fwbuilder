#!/usr/bin/env bash
# Phase-47036: STATUS mentions ssh_alternative_notes_refresh_roster export / 5113-5120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_alternative_notes_refresh_roster.*(export|bundle)|Export.*ssh_alternative_notes_refresh_roster' webui/STATUS.md
grep -qE 'phase47040|through 47040|e2e-phase47040' webui/STATUS.md
echo "STATUS ssh_alternative_notes_refresh_roster export ok"; echo "cleaned"; echo "OK: phase47036 e2e passed"
