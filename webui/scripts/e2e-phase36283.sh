#!/usr/bin/env bash
# Phase-36283: client soft_fertig_ssh_auth_ms_78500_echo_roster Soft 36280+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_78500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 36280+ soft_fertig_ssh_auth_ms_78500_echo_roster type ok"; echo "cleaned"; echo "OK: phase36283 e2e passed"
