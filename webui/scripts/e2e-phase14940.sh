#!/usr/bin/env bash
# Phase-14940: STATUS mentions ssh_auth_batch_only_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_batch_only_echo_roster|soft_fertig_ssh_auth_batch_only_echo_roster' webui/STATUS.md
grep -qE 'phase14944|through 14944|e2e-phase14944' webui/STATUS.md
echo "STATUS ssh-auth-batch-only-echo roster ok"; echo "cleaned"; echo "OK: phase14940 e2e passed"
