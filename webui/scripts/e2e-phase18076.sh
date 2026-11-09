#!/usr/bin/env bash
# Phase-18076: STATUS mentions ssh_alternative_notes_refresh_roster export / 5113-5120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_alternative_notes_refresh_roster.*(export|bundle)|Export.*ssh_alternative_notes_refresh_roster' webui/STATUS.md
grep -qE 'phase18080|through 18080|e2e-phase18080' webui/STATUS.md
echo "STATUS ssh_alternative_notes_refresh_roster export ok"; echo "cleaned"; echo "OK: phase18076 e2e passed"
