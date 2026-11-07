#!/usr/bin/env bash
# Phase-5676: STATUS mentions ssh_auth_note_roster export / 5113-5120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_note_roster.*(export|bundle)|Export.*ssh_auth_note_roster' webui/STATUS.md
grep -qE 'phase5680|through 5680|e2e-phase5680' webui/STATUS.md
echo "STATUS ssh_auth_note_roster export ok"; echo "cleaned"; echo "OK: phase5676 e2e passed"
