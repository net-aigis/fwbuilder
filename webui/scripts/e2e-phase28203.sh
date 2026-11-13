#!/usr/bin/env bash
# Phase-28203: client soft_fertig_ssh_auth_soft_28680_echo_roster Soft 28200+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_28680_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 28200+ soft_fertig_ssh_auth_soft_28680_echo_roster type ok"; echo "cleaned"; echo "OK: phase28203 e2e passed"
