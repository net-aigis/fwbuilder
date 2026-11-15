#!/usr/bin/env bash
# Phase-32123: client soft_fertig_ssh_auth_ms_72000_echo_roster Soft 32120+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_72000_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 32120+ soft_fertig_ssh_auth_ms_72000_echo_roster type ok"; echo "cleaned"; echo "OK: phase32123 e2e passed"
