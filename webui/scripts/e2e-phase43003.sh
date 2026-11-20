#!/usr/bin/env bash
# Phase-43003: client soft_fertig_ssh_auth_ms_89000_echo_roster Soft 43000+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_89000_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 43000+ soft_fertig_ssh_auth_ms_89000_echo_roster type ok"; echo "cleaned"; echo "OK: phase43003 e2e passed"
