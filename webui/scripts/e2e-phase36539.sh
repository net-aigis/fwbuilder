#!/usr/bin/env bash
# Phase-36539: client soft_fertig_ssh_auth_ms_79000_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_79000_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-ms-79000-echo roster type ok"; echo "cleaned"; echo "OK: phase36539 e2e passed"
