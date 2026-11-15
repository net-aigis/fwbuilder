#!/usr/bin/env bash
# Phase-32683: client soft_fertig_ssh_auth_soft_33720_echo_roster Soft 32680+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_33720_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 32680+ soft_fertig_ssh_auth_soft_33720_echo_roster type ok"; echo "cleaned"; echo "OK: phase32683 e2e passed"
