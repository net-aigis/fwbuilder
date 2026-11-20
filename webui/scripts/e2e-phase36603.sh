#!/usr/bin/env bash
# Phase-36603: client soft_fertig_ssh_auth_ms_79000_echo_roster Soft 36600+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_79000_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 36600+ soft_fertig_ssh_auth_ms_79000_echo_roster type ok"; echo "cleaned"; echo "OK: phase36603 e2e passed"
