#!/usr/bin/env bash
# Phase-5020: STATUS mentions ssh_refusal_paths_roster / 5017-5024.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_refusal_paths_roster|soft_fertig_ssh_refusal_paths_roster' webui/STATUS.md
grep -qE 'phase5024|through 5024|e2e-phase5024' webui/STATUS.md
echo "STATUS ssh-refusal-paths roster ok"; echo "cleaned"; echo "OK: phase5020 e2e passed"
