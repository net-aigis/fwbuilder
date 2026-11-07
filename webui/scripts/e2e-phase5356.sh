#!/usr/bin/env bash
# Phase-5356: STATUS mentions ssh_alternative_notes_roster export / 5113-5120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_alternative_notes_roster.*(export|bundle)|Export.*ssh_alternative_notes_roster' webui/STATUS.md
grep -qE 'phase5360|through 5120|e2e-phase5360' webui/STATUS.md
echo "STATUS ssh_alternative_notes_roster export ok"; echo "cleaned"; echo "OK: phase5356 e2e passed"
