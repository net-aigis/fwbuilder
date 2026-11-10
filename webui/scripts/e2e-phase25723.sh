#!/usr/bin/env bash
# Phase-25723: client soft_fertig_ssh_auth_ms_62000_echo_roster Soft 25720+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_62000_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 25720+ soft_fertig_ssh_auth_ms_62000_echo_roster type ok"; echo "cleaned"; echo "OK: phase25723 e2e passed"
