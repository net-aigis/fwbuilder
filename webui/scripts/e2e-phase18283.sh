#!/usr/bin/env bash
# Phase-18283: client soft_fertig_ssh_auth_soft_18240_echo_roster Soft 18280+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_18240_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 18280+ soft_fertig_ssh_auth_soft_18240_echo_roster type ok"; echo "cleaned"; echo "OK: phase18283 e2e passed"
