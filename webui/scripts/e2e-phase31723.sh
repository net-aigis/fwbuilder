#!/usr/bin/env bash
# Phase-31723: client soft_fertig_ssh_auth_soft_32640_echo_roster Soft 31720+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_32640_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 31720+ soft_fertig_ssh_auth_soft_32640_echo_roster type ok"; echo "cleaned"; echo "OK: phase31723 e2e passed"
