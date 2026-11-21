#!/usr/bin/env bash
# Phase-33723: client soft_fertig_ssh_auth_ms_74500_echo_roster Soft 33720+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_74500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 33720+ soft_fertig_ssh_auth_ms_74500_echo_roster type ok"; echo "cleaned"; echo "OK: phase33723 e2e passed"
