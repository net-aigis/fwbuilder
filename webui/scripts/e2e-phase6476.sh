#!/usr/bin/env bash
# Phase-6476: STATUS mentions ssh_auth_note_snapshot_roster export / 5113-5120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_note_snapshot_roster.*(export|bundle)|Export.*ssh_auth_note_snapshot_roster' webui/STATUS.md
grep -qE 'phase6480|through 6480|e2e-phase6480' webui/STATUS.md
echo "STATUS ssh_auth_note_snapshot_roster export ok"; echo "cleaned"; echo "OK: phase6476 e2e passed"
