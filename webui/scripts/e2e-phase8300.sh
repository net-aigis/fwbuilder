#!/usr/bin/env bash
# Phase-8300: STATUS mentions ssh_implemented_batch_refresh_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_implemented_batch_refresh_roster|soft_fertig_ssh_implemented_batch_refresh_roster' webui/STATUS.md
grep -qE 'phase8304|through 8304|e2e-phase8304' webui/STATUS.md
echo "STATUS ssh-implemented-batch-refresh roster ok"; echo "cleaned"; echo "OK: phase8300 e2e passed"
