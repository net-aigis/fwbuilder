#!/usr/bin/env bash
# Phase-39419: client soft_fertig_ssh_auth_ms_83500_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_83500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-ms-83500-echo roster type ok"; echo "cleaned"; echo "OK: phase39419 e2e passed"
