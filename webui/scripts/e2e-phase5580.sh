#!/usr/bin/env bash
# Phase-5580: STATUS mentions ssh_refusal_path_notes_roster / 5097-5104.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_refusal_path_notes_roster|soft_fertig_ssh_refusal_path_notes_roster' webui/STATUS.md
grep -qE 'phase5584|through 5104|e2e-phase5584' webui/STATUS.md
echo "STATUS ssh-refusal-path-notes roster ok"; echo "cleaned"; echo "OK: phase5580 e2e passed"
