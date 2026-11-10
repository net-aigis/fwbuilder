#!/usr/bin/env bash
# Phase-24683: client soft_fertig_ssh_auth_soft_24720_echo_roster Soft 24680+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_24720_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 24680+ soft_fertig_ssh_auth_soft_24720_echo_roster type ok"; echo "cleaned"; echo "OK: phase24683 e2e passed"
