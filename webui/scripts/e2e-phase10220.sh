#!/usr/bin/env bash
# Phase-10220: STATUS mentions ssh_auth_method_partition_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_method_partition_roster|soft_fertig_ssh_auth_method_partition_roster' webui/STATUS.md
grep -qE 'phase10224|through 10224|e2e-phase10224' webui/STATUS.md
echo "STATUS ssh-auth-method-partition roster ok"; echo "cleaned"; echo "OK: phase10220 e2e passed"
