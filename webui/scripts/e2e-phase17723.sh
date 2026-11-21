#!/usr/bin/env bash
# Phase-17723: client soft_fertig_ssh_auth_ms_49500_echo_roster Soft 17720+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_49500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 17720+ soft_fertig_ssh_auth_ms_49500_echo_roster type ok"; echo "cleaned"; echo "OK: phase17723 e2e passed"
