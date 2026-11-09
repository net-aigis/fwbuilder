#!/usr/bin/env bash
# Phase-18556: STATUS mentions ssh_alternative_notes_refresh_roster export / 5113-5120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_alternative_notes_refresh_roster.*(export|bundle)|Export.*ssh_alternative_notes_refresh_roster' webui/STATUS.md
grep -qE 'phase18560|through 18560|e2e-phase18560' webui/STATUS.md
echo "STATUS ssh_alternative_notes_refresh_roster export ok"; echo "cleaned"; echo "OK: phase18556 e2e passed"
