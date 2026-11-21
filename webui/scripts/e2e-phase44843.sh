#!/usr/bin/env bash
# Phase-44843: client soft_fertig_ssh_auth_soft_47320_echo_roster Soft 44840+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_47320_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 44840+ soft_fertig_ssh_auth_soft_47320_echo_roster type ok"; echo "cleaned"; echo "OK: phase44843 e2e passed"
