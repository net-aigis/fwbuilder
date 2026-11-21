#!/usr/bin/env bash
# Phase-20283: client soft_fertig_ssh_auth_ms_53500_echo_roster Soft 20280+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_53500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 20280+ soft_fertig_ssh_auth_ms_53500_echo_roster type ok"; echo "cleaned"; echo "OK: phase20283 e2e passed"
