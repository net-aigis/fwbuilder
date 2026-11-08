#!/usr/bin/env bash
# Phase-6460: STATUS mentions ssh_auth_note_snapshot_roster / 5973-5979.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_note_snapshot_roster|soft_fertig_ssh_auth_note_snapshot_roster' webui/STATUS.md
grep -qE 'phase6464|through 6464|e2e-phase6464' webui/STATUS.md
echo "STATUS ssh-not-implemented-batch roster ok"; echo "cleaned"; echo "OK: phase6460 e2e passed"
