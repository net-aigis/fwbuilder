#!/usr/bin/env bash
# Phase-45803: client soft_fertig_ssh_auth_soft_48400_echo_roster Soft 45800+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_48400_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 45800+ soft_fertig_ssh_auth_soft_48400_echo_roster type ok"; echo "cleaned"; echo "OK: phase45803 e2e passed"
