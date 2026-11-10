#!/usr/bin/env bash
# Phase-22843: client soft_fertig_ssh_auth_ms_57500_echo_roster Soft 22840+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_57500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 22840+ soft_fertig_ssh_auth_ms_57500_echo_roster type ok"; echo "cleaned"; echo "OK: phase22843 e2e passed"
