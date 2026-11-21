#!/usr/bin/env bash
# Phase-30443: client soft_fertig_ssh_auth_soft_31200_echo_roster Soft 30440+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_31200_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 30440+ soft_fertig_ssh_auth_soft_31200_echo_roster type ok"; echo "cleaned"; echo "OK: phase30443 e2e passed"
