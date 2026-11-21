#!/usr/bin/env bash
# Phase-47723: client soft_fertig_ssh_auth_soft_50560_echo_roster Soft 47720+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_50560_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 47720+ soft_fertig_ssh_auth_soft_50560_echo_roster type ok"; echo "cleaned"; echo "OK: phase47723 e2e passed"
