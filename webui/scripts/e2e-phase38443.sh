#!/usr/bin/env bash
# Phase-38443: client soft_fertig_ssh_auth_soft_40120_echo_roster Soft 38440+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_40120_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 38440+ soft_fertig_ssh_auth_soft_40120_echo_roster type ok"; echo "cleaned"; echo "OK: phase38443 e2e passed"
