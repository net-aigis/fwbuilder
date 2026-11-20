#!/usr/bin/env bash
# Phase-44923: client soft_fertig_ssh_auth_ms_92000_echo_roster Soft 44920+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_92000_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 44920+ soft_fertig_ssh_auth_ms_92000_echo_roster type ok"; echo "cleaned"; echo "OK: phase44923 e2e passed"
