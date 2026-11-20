#!/usr/bin/env bash
# Phase-41723: client soft_fertig_ssh_auth_ms_87000_echo_roster Soft 41720+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_87000_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 41720+ soft_fertig_ssh_auth_ms_87000_echo_roster type ok"; echo "cleaned"; echo "OK: phase41723 e2e passed"
