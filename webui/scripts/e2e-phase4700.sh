#!/usr/bin/env bash
# Phase-4700: STATUS mentions ssh_not_implemented_roster / 4697-4704.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'ssh_not_implemented_roster|soft_fertig_ssh_not_implemented_roster' webui/STATUS.md
grep -qE 'phase4704|through 4704|e2e-phase4704' webui/STATUS.md
echo "STATUS ssh-not-implemented roster ok"
echo "cleaned"
echo "OK: phase4700 e2e passed"
