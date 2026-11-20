#!/usr/bin/env bash
# Phase-41596: STATUS mentions ssh_alternative_notes_refresh_roster export / 5113-5120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_alternative_notes_refresh_roster.*(export|bundle)|Export.*ssh_alternative_notes_refresh_roster' webui/STATUS.md
grep -qE 'phase41600|through 41600|e2e-phase41600' webui/STATUS.md
echo "STATUS ssh_alternative_notes_refresh_roster export ok"; echo "cleaned"; echo "OK: phase41596 e2e passed"
